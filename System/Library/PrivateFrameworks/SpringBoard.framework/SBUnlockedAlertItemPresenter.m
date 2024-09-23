@implementation SBUnlockedAlertItemPresenter

- (SBUnlockedAlertItemPresenter)initWithSharedModalAlertItemPresenter:(id)a3 windowSceneManager:(id)a4
{
  id v6;
  id v7;
  SBUnlockedAlertItemPresenter *v8;
  SBAlertItemPresenterWindowSceneResolver *v9;
  SBAlertItemPresenterWindowSceneResolver *windowSceneResolver;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBUnlockedAlertItemPresenter;
  v8 = -[SBUnlockedAlertItemPresenter init](&v12, sel_init);
  if (v8)
  {
    v9 = -[SBAlertItemPresenterWindowSceneResolver initWithSharedModalAlertItemPresenter:windowSceneManager:]([SBAlertItemPresenterWindowSceneResolver alloc], "initWithSharedModalAlertItemPresenter:windowSceneManager:", v6, v7);
    windowSceneResolver = v8->_windowSceneResolver;
    v8->_windowSceneResolver = v9;

  }
  return v8;
}

- (BOOL)presentsAlertItemsModally
{
  return 1;
}

- (BOOL)canPresentMultipleAlertItemsSimultaneously
{
  return 1;
}

- (void)presentAlertItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v13 = a3;
  v8 = a5;
  BSDispatchQueueAssertMain();
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "noteViewCovered");

  if (objc_msgSend(v13, "wakeDisplay"))
  {
    +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resetIdleTimerForReason:", CFSTR("PresentAlertItem"));

  }
  -[SBUnlockedAlertItemPresenter windowSceneResolver](self, "windowSceneResolver");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resolvedSharedModalAlertItemPresenterForAlertItem:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentAlertItem:isLocked:animated:completion:", v13, 0, v6, v8);

}

- (void)dismissAlertItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  BSDispatchQueueAssertMain();
  -[SBUnlockedAlertItemPresenter windowSceneResolver](self, "windowSceneResolver");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resolvedSharedModalAlertItemPresenterForAlertItem:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dismissAlertItem:animated:completion:", v9, v5, v8);

}

- (void)windowSceneDidConnect:(id)a3 withSharedModalAlertItemPresenter:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (v12)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUnlockedAlertItemPresenter.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("windowScene"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUnlockedAlertItemPresenter.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharedModalAlertItemPresenter"));

LABEL_3:
  -[SBUnlockedAlertItemPresenter windowSceneResolver](self, "windowSceneResolver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SBUnlockedAlertItemPresenter windowSceneResolver](self, "windowSceneResolver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowSceneDidConnect:withSharedModalAlertItemPresenter:", v12, v7);

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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUnlockedAlertItemPresenter.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("windowScene"));

  }
  -[SBUnlockedAlertItemPresenter windowSceneResolver](self, "windowSceneResolver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v9;
  if (v5)
  {
    -[SBUnlockedAlertItemPresenter windowSceneResolver](self, "windowSceneResolver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowSceneDidDisconnect:", v9);

    v6 = v9;
  }

}

- (SBAlertItemPresenterWindowSceneResolver)windowSceneResolver
{
  return self->_windowSceneResolver;
}

- (void)setWindowSceneResolver:(id)a3
{
  objc_storeStrong((id *)&self->_windowSceneResolver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowSceneResolver, 0);
}

@end
