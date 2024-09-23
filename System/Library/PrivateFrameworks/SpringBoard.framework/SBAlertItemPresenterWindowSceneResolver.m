@implementation SBAlertItemPresenterWindowSceneResolver

- (SBAlertItemPresenterWindowSceneResolver)initWithSharedModalAlertItemPresenter:(id)a3 windowSceneManager:(id)a4
{
  id v6;
  id v7;
  SBAlertItemPresenterWindowSceneResolver *v8;
  uint64_t v9;
  NSMapTable *modalAlertPresenters;
  NSMapTable *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBAlertItemPresenterWindowSceneResolver;
  v8 = -[SBAlertItemPresenterWindowSceneResolver init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    modalAlertPresenters = v8->_modalAlertPresenters;
    v8->_modalAlertPresenters = (NSMapTable *)v9;

    v11 = v8->_modalAlertPresenters;
    objc_msgSend(v6, "windowScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](v11, "setObject:forKey:", v6, v12);

    objc_storeStrong((id *)&v8->_windowSceneManager, a4);
  }

  return v8;
}

- (void)windowSceneDidConnect:(id)a3 withSharedModalAlertItemPresenter:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  if (v14)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAlertItemPresenterWindowSceneResolver.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("windowScene"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAlertItemPresenterWindowSceneResolver.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharedModalAlertItemPresenter"));

LABEL_3:
  -[SBAlertItemPresenterWindowSceneResolver modalAlertPresenters](self, "modalAlertPresenters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[SBAlertItemPresenterWindowSceneResolver modalAlertPresenters](self, "modalAlertPresenters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v7, v14);

  }
}

- (void)windowSceneDidDisconnect:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAlertItemPresenterWindowSceneResolver.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("windowScene"));

  }
  -[SBAlertItemPresenterWindowSceneResolver modalAlertPresenters](self, "modalAlertPresenters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[SBAlertItemPresenterWindowSceneResolver modalAlertPresenters](self, "modalAlertPresenters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v9);

}

- (id)resolvedSharedModalAlertItemPresenterForAlertItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "alertController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sbWindowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_preferredActivationWindowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast((uint64_t)v7, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_4;
  }
  -[SBAlertItemPresenterWindowSceneResolver modalAlertPresenters](self, "modalAlertPresenters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_4:
    -[SBAlertItemPresenterWindowSceneResolver windowSceneManager](self, "windowSceneManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activeDisplayWindowScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBAlertItemPresenterWindowSceneResolver modalAlertPresenters](self, "modalAlertPresenters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (NSMapTable)modalAlertPresenters
{
  return self->_modalAlertPresenters;
}

- (SBWindowSceneManager)windowSceneManager
{
  return self->_windowSceneManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowSceneManager, 0);
  objc_storeStrong((id *)&self->_modalAlertPresenters, 0);
}

@end
