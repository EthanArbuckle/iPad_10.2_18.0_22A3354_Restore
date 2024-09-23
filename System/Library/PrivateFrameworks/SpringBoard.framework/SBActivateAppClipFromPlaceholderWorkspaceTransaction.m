@implementation SBActivateAppClipFromPlaceholderWorkspaceTransaction

- (void)_begin
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SBRotateScenesWorkspaceTransaction *v16;
  SBRotateScenesWorkspaceTransaction *rotateScenesTransaction;
  void *v18;
  objc_super v19;
  _QWORD v20[6];

  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "previousLayoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "interfaceOrientation");

  objc_msgSend(v5, "layoutState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "interfaceOrientation");

  objc_msgSend(v5, "resolvedActivatingWorkspaceEntity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deviceApplicationSceneEntity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBActivateAppClipFromPlaceholderWorkspaceTransaction.m"), 38, CFSTR("Expected non-nil applicationSceneEntity"));

  }
  objc_msgSend(v11, "sceneHandle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "_mainSceneSupportsInterfaceOrientation:", v7) & 1) != 0)
  {
    v19.receiver = self;
    v19.super_class = (Class)SBActivateAppClipFromPlaceholderWorkspaceTransaction;
    -[SBAppToAppWorkspaceTransaction _begin](&v19, sel__begin);
  }
  else
  {
    -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "workspace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "createRequestWithOptions:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __62__SBActivateAppClipFromPlaceholderWorkspaceTransaction__begin__block_invoke;
    v20[3] = &__block_descriptor_48_e54_v16__0__SBWorkspaceApplicationSceneTransitionContext_8l;
    v20[4] = v9;
    v20[5] = v7;
    objc_msgSend(v15, "modifyApplicationContext:", v20);
    v16 = -[SBAppToAppWorkspaceTransaction initWithTransitionRequest:]([SBRotateScenesWorkspaceTransaction alloc], "initWithTransitionRequest:", v15);
    rotateScenesTransaction = self->_rotateScenesTransaction;
    self->_rotateScenesTransaction = v16;

    -[SBRotateScenesWorkspaceTransaction addObserver:](self->_rotateScenesTransaction, "addObserver:", self);
    -[SBActivateAppClipFromPlaceholderWorkspaceTransaction addMilestone:](self, "addMilestone:", CFSTR("kActivateAppClipFromPlaceholderWaitingForRotation"));
    -[SBActivateAppClipFromPlaceholderWorkspaceTransaction addChildTransaction:](self, "addChildTransaction:", self->_rotateScenesTransaction);

  }
}

void __62__SBActivateAppClipFromPlaceholderWorkspaceTransaction__begin__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setInterfaceOrientation:", v3);
  +[SBAnimationUtilities animationSettingsForRotationFromInterfaceOrientation:toInterfaceOrientation:](SBAnimationUtilities, "animationSettingsForRotationFromInterfaceOrientation:toInterfaceOrientation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnimationSettings:", v5);

}

- (void)transactionDidComplete:(id)a3
{
  SBRotateScenesWorkspaceTransaction *v4;
  SBRotateScenesWorkspaceTransaction *v5;
  objc_super v6;

  v4 = (SBRotateScenesWorkspaceTransaction *)a3;
  v5 = v4;
  if (self->_rotateScenesTransaction == v4)
  {
    self->_rotateScenesTransaction = 0;

    v6.receiver = self;
    v6.super_class = (Class)SBActivateAppClipFromPlaceholderWorkspaceTransaction;
    -[SBAppToAppWorkspaceTransaction _begin](&v6, sel__begin);
    -[SBActivateAppClipFromPlaceholderWorkspaceTransaction satisfyMilestone:](self, "satisfyMilestone:", CFSTR("kActivateAppClipFromPlaceholderWaitingForRotation"));
  }

}

- (unint64_t)_serialOverlayPreDismissalOptions
{
  return 0;
}

- (unint64_t)_concurrentOverlayDismissalOptions
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotateScenesTransaction, 0);
}

@end
