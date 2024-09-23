@implementation SBPosterBoardModalEditingManager

- (SBPosterBoardModalEditingManager)init
{
  SBPosterBoardModalEditingManager *v2;
  PRUISExternallyHostedPosterEditingServer *v3;
  PRUISExternallyHostedPosterEditingServer *posterEditingServer;
  uint64_t v5;
  NSMutableArray *presentedTransientOverlayControllers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBPosterBoardModalEditingManager;
  v2 = -[SBPosterBoardModalEditingManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (PRUISExternallyHostedPosterEditingServer *)objc_alloc_init(MEMORY[0x1E0D7F7D8]);
    posterEditingServer = v2->_posterEditingServer;
    v2->_posterEditingServer = v3;

    -[PRUISExternallyHostedPosterEditingServer activate](v2->_posterEditingServer, "activate");
    -[PRUISExternallyHostedPosterEditingServer setDelegate:](v2->_posterEditingServer, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    presentedTransientOverlayControllers = v2->_presentedTransientOverlayControllers;
    v2->_presentedTransientOverlayControllers = (NSMutableArray *)v5;

  }
  return v2;
}

- (BOOL)beginExternalPosterEditingSessionWithEditingRequest:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  SBPosterEditingTransientOverlayViewController *v9;
  void (**v10)(_QWORD);
  NSObject *v11;

  v7 = a3;
  if (v7)
  {
    v8 = a4;
    v9 = -[SBPosterEditingTransientOverlayViewController initWithEditingRequest:]([SBPosterEditingTransientOverlayViewController alloc], "initWithEditingRequest:", v7);
    -[SBPosterEditingTransientOverlayViewController setDelegate:](v9, "setDelegate:", self);
    -[SBPosterBoardModalEditingManager _presentTransientOverlayViewController:animated:completion:](self, "_presentTransientOverlayViewController:animated:completion:", v9, 0, v8);

  }
  else
  {
    v10 = (void (**)(_QWORD))a4;
    SBLogWallpaper();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SBPosterBoardModalEditingManager beginExternalPosterEditingSessionWithEditingRequest:completion:].cold.1((uint64_t)self, (uint64_t)a2, v11);

    v10[2](v10);
  }

  return v7 != 0;
}

- (void)sendRequestDismissalActionWithEditingRequest:(id)a3
{
  id v5;
  NSMutableArray *presentedTransientOverlayControllers;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPosterBoardModalEditingManager.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("editingRequest"));

  }
  presentedTransientOverlayControllers = self->_presentedTransientOverlayControllers;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__SBPosterBoardModalEditingManager_sendRequestDismissalActionWithEditingRequest___block_invoke;
  v11[3] = &unk_1E8EAC340;
  v12 = v5;
  v10 = v5;
  -[NSMutableArray bs_firstObjectPassingTest:](presentedTransientOverlayControllers, "bs_firstObjectPassingTest:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "sendRequestDismissalAction");

}

uint64_t __81__SBPosterBoardModalEditingManager_sendRequestDismissalActionWithEditingRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "editingRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BSEqualObjects();

  return v3;
}

- (void)posterEditingTransientOverlayViewController:(id)a3 willDismissWithResponse:(id)a4
{
  PRUISExternallyHostedPosterEditingServer *posterEditingServer;
  id v6;
  id v7;

  posterEditingServer = self->_posterEditingServer;
  v6 = a4;
  objc_msgSend(a3, "editingRequest");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PRUISExternallyHostedPosterEditingServer sessionWithEditingRequest:willEndEditingWithResponse:](posterEditingServer, "sessionWithEditingRequest:willEndEditingWithResponse:", v7, v6);

}

- (void)posterEditingTransientOverlayViewController:(id)a3 didDismissWithResponse:(id)a4
{
  PRUISExternallyHostedPosterEditingServer *posterEditingServer;
  id v7;
  void *v8;
  id v9;

  posterEditingServer = self->_posterEditingServer;
  v7 = a4;
  v9 = a3;
  objc_msgSend(v9, "editingRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRUISExternallyHostedPosterEditingServer sessionWithEditingRequest:didEndEditingWithResponse:](posterEditingServer, "sessionWithEditingRequest:didEndEditingWithResponse:", v8, v7);

  -[SBPosterBoardModalEditingManager _dismissTransientOverlayViewControllerIfPresenting:animated:completion:](self, "_dismissTransientOverlayViewControllerIfPresenting:animated:completion:", v9, 0, 0);
}

- (void)_presentTransientOverlayViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if ((-[NSMutableArray containsObject:](self->_presentedTransientOverlayControllers, "containsObject:", v8) & 1) == 0)
  {
    objc_initWeak(&location, self);
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __95__SBPosterBoardModalEditingManager__presentTransientOverlayViewController_animated_completion___block_invoke;
    v11[3] = &unk_1E8EA0510;
    objc_copyWeak(&v14, &location);
    v12 = v8;
    v13 = v9;
    objc_msgSend(v10, "presentTransientOverlayViewController:animated:completion:", v12, v6, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

void __95__SBPosterBoardModalEditingManager__presentTransientOverlayViewController_animated_completion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[2], "addObject:", *(_QWORD *)(a1 + 32));
    v3 = v5;
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(uint64_t, id *))(v4 + 16))(v4, v3);
    v3 = v5;
  }

}

- (void)_dismissTransientOverlayViewControllerIfPresenting:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (-[NSMutableArray containsObject:](self->_presentedTransientOverlayControllers, "containsObject:", v8))
  {
    objc_initWeak(&location, self);
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __107__SBPosterBoardModalEditingManager__dismissTransientOverlayViewControllerIfPresenting_animated_completion___block_invoke;
    v11[3] = &unk_1E8EA0510;
    objc_copyWeak(&v14, &location);
    v12 = v8;
    v13 = v9;
    objc_msgSend(v10, "dismissTransientOverlayViewController:animated:completion:", v12, v6, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

void __107__SBPosterBoardModalEditingManager__dismissTransientOverlayViewControllerIfPresenting_animated_completion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[2], "removeObject:", *(_QWORD *)(a1 + 32));
    v3 = v5;
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(uint64_t, id *))(v4 + 16))(v4, v3);
    v3 = v5;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedTransientOverlayControllers, 0);
  objc_storeStrong((id *)&self->_posterEditingServer, 0);
}

- (void)beginExternalPosterEditingSessionWithEditingRequest:(NSObject *)a3 completion:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _SBFLoggingMethodProem();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1D0540000, a3, OS_LOG_TYPE_ERROR, "%{public}@ an entry point is required!", (uint8_t *)&v5, 0xCu);

}

@end
