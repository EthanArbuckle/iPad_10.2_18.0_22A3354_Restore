@implementation UVSceneHost

+ (id)createWithInjectedScene:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  NSObject *v21;

  v5 = a3;
  objc_msgSend(v5, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("UVSceneHost-%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "uiPresentationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createPresenterWithIdentifier:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v19 = -[UVSceneHost _initWithHostIdentifier:scenePresenter:injectedScene:]([UVSceneHost alloc], "_initWithHostIdentifier:scenePresenter:injectedScene:", v9, v11, v5);
  }
  else
  {
    UVPreviewsServicesError(CFSTR("Failed to make UIScenePresentationManager for scene %@"), v12, v13, v14, v15, v16, v17, v18, (uint64_t)v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    UVLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      +[UVSceneHost createWithInjectedScene:error:].cold.1(v20, v21);

    if (a4)
      *a4 = objc_retainAutorelease(v20);

    v19 = 0;
  }

  return v19;
}

- (id)_initWithHostIdentifier:(id)a3 scenePresenter:(id)a4 injectedScene:(id)a5
{
  id v9;
  id v10;
  id v11;
  UVSceneHost *v12;
  id *p_isa;
  void *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)UVSceneHost;
  v12 = -[UVSceneHost init](&v16, sel_init);
  p_isa = (id *)&v12->super.super.super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_hostIdentifier, a3);
    objc_storeStrong(p_isa + 53, a4);
    objc_storeWeak(p_isa + 55, v11);
    objc_msgSend(p_isa[53], "modifyPresentationContext:", &__block_literal_global);
    objc_msgSend(p_isa[53], "activate");
    objc_msgSend(p_isa[53], "presentationView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "addSubview:", v14);

  }
  return p_isa;
}

uint64_t __68__UVSceneHost__initWithHostIdentifier_scenePresenter_injectedScene___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAppearanceStyle:", 2);
}

- (void)dealloc
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_22AE41000, log, OS_LOG_TYPE_FAULT, "UVSceneHost deallocated without being invalidated", v1, 2u);
}

- (void)invalidate
{
  void *v3;
  UIScenePresenter *scenePresenter;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[UIScenePresenter presentationView](self->_scenePresenter, "presentationView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

    -[UIScenePresenter invalidate](self->_scenePresenter, "invalidate");
    scenePresenter = self->_scenePresenter;
    self->_scenePresenter = 0;

  }
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UVSceneHost;
  -[UVSceneHost layoutSubviews](&v4, sel_layoutSubviews);
  -[UIScenePresenter presentationView](self->_scenePresenter, "presentationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UVSceneHost bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (UVInjectedScene)injectedScene
{
  return (UVInjectedScene *)objc_loadWeakRetained((id *)&self->_injectedScene);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_injectedScene);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
}

+ (void)createWithInjectedScene:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_fault_impl(&dword_22AE41000, a2, OS_LOG_TYPE_FAULT, "%{public}@", (uint8_t *)&v4, 0xCu);

}

@end
