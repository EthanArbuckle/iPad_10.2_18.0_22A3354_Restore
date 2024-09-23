@implementation PKPaymentAuthorizationPresentersCoordinator

+ (id)coordinators
{
  if (_MergedGlobals_690 != -1)
    dispatch_once(&_MergedGlobals_690, &__block_literal_global_232);
  return (id)qword_1ED06C868;
}

void __59__PKPaymentAuthorizationPresentersCoordinator_coordinators__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)qword_1ED06C868;
  qword_1ED06C868 = (uint64_t)v0;

}

+ (id)coordinatorForHostWithUserInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PKPaymentAuthorizationPresentersCoordinator *v7;
  NSObject *v8;
  uint8_t v10[16];

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("hostIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "coordinators");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (PKPaymentAuthorizationPresentersCoordinator *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (objc_msgSend(v6, "count"))
    {
      PKLogFacilityTypeGetObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationPresentersCoordinator: stale coordinators when creating a new one - invalidating them.", v10, 2u);
      }

      objc_msgSend(a1, "invalidateCoordinators:", v6);
    }
    v7 = -[PKPaymentAuthorizationPresentersCoordinator initWithHostUserInfo:]([PKPaymentAuthorizationPresentersCoordinator alloc], "initWithHostUserInfo:", v4);
    objc_msgSend(v6, "setObject:forKey:", v7, v5);
  }

  return v7;
}

+ (void)invalidateCoordinators:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (id)objc_msgSend(a3, "copy");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "invalidate");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

+ (void)coordinatorDidInvalidate:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "hostUserInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("hostIdentifier"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "coordinators");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v6);

}

- (PKPaymentAuthorizationPresentersCoordinator)initWithHostUserInfo:(id)a3
{
  id v4;
  PKPaymentAuthorizationPresentersCoordinator *v5;
  uint64_t v6;
  NSDictionary *hostUserInfo;
  PKAsyncTaskProgressTracker *v8;
  PKAsyncTaskProgressTracker *invalidationTracker;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentAuthorizationPresentersCoordinator;
  v5 = -[PKPaymentAuthorizationPresentersCoordinator init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    hostUserInfo = v5->_hostUserInfo;
    v5->_hostUserInfo = (NSDictionary *)v6;

    v8 = (PKAsyncTaskProgressTracker *)objc_alloc_init(MEMORY[0x1E0D66B88]);
    invalidationTracker = v5->_invalidationTracker;
    v5->_invalidationTracker = v8;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[PKPaymentAuthorizationPresentersCoordinator invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationPresentersCoordinator;
  -[PKPaymentAuthorizationPresentersCoordinator dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  -[PKPaymentAuthorizationFlowCoordinator invalidate](self->_flowCoordinator, "invalidate");
}

- (void)flowCoordinatorDidInvalidate
{
  PKPaymentAuthorizationFlowCoordinator *flowCoordinator;

  flowCoordinator = self->_flowCoordinator;
  self->_flowCoordinator = 0;

  -[PKAsyncTaskProgressTracker taskDidComplete](self->_invalidationTracker, "taskDidComplete");
  +[PKPaymentAuthorizationPresentersCoordinator coordinatorDidInvalidate:](PKPaymentAuthorizationPresentersCoordinator, "coordinatorDidInvalidate:", self);
}

- (void)viewController:(id)a3 didActivateWithPresentationMode:(int64_t)a4
{
  id v6;

  v6 = a3;
  if (-[PKPaymentAuthorizationPresentersCoordinator isPresentationModeForPrimaryViewController:](self, "isPresentationModeForPrimaryViewController:", a4))
  {
    -[PKPaymentAuthorizationPresentersCoordinator primaryViewController:didActivateWithPresentationMode:](self, "primaryViewController:didActivateWithPresentationMode:", v6, a4);
  }
  else
  {
    -[PKPaymentAuthorizationPresentersCoordinator secondaryViewController:didActivateWithPresentationMode:](self, "secondaryViewController:didActivateWithPresentationMode:", v6, a4);
  }

}

- (BOOL)isPresentationModeForPrimaryViewController:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3)
    return 1;
  if (a3)
    return 0;
  return self->_primaryTarget == 0;
}

- (void)primaryViewController:(id)a3 didActivateWithPresentationMode:(int64_t)a4
{
  id v6;
  NSObject *v7;
  PKPaymentAuthorizationPresentationTarget *v8;
  PKPaymentAuthorizationPresentationTarget *primaryTarget;
  uint8_t v10[16];

  v6 = a3;
  if (self->_primaryTarget)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationPresentersCoordinator: primary view controller was activated twice - something's off.", v10, 2u);
    }

  }
  else
  {
    v8 = objc_alloc_init(PKPaymentAuthorizationPresentationTarget);
    primaryTarget = self->_primaryTarget;
    self->_primaryTarget = v8;

    -[PKPaymentAuthorizationPresentationTarget setPresentingViewController:](self->_primaryTarget, "setPresentingViewController:", v6);
    -[PKPaymentAuthorizationPresentationTarget presentPendingViewControllerIfNecessary](self->_primaryTarget, "presentPendingViewControllerIfNecessary");
    -[PKPaymentAuthorizationPresentersCoordinator configureSceneWithPrimaryPresentationMode:](self, "configureSceneWithPrimaryPresentationMode:", a4);
    -[PKPaymentAuthorizationPresentersCoordinator start](self, "start");
  }

}

- (void)configureSceneWithPrimaryPresentationMode:(int64_t)a3
{
  self->_shouldRequestSecondaryViewControllerPresenter = -[PKPaymentAuthorizationPresentersCoordinator shouldSecondaryViewControllerBeRequestedInSceneWithPresentationMode:](self, "shouldSecondaryViewControllerBeRequestedInSceneWithPresentationMode:", a3);
}

- (BOOL)shouldSecondaryViewControllerBeRequestedInSceneWithPresentationMode:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) != 2;
}

- (void)secondaryViewController:(id)a3 didActivateWithPresentationMode:(int64_t)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  PKPaymentAuthorizationPresentationTarget *secondaryTarget;
  PKPaymentAuthorizationPresentationTarget *v9;
  PKPaymentAuthorizationPresentationTarget *v10;
  uint8_t v11[16];

  v5 = a3;
  -[PKPaymentAuthorizationPresentationTarget presentingViewController](self->_secondaryTarget, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationPresentersCoordinator: secondary view controller was activated twice - something's off.", v11, 2u);
    }

  }
  else
  {
    secondaryTarget = self->_secondaryTarget;
    if (!secondaryTarget)
    {
      v9 = objc_alloc_init(PKPaymentAuthorizationPresentationTarget);
      v10 = self->_secondaryTarget;
      self->_secondaryTarget = v9;

      secondaryTarget = self->_secondaryTarget;
    }
    -[PKPaymentAuthorizationPresentationTarget setPresentingViewController:](secondaryTarget, "setPresentingViewController:", v5);
    -[PKPaymentAuthorizationPresentationTarget presentPendingViewControllerIfNecessary](self->_secondaryTarget, "presentPendingViewControllerIfNecessary");
  }

}

- (void)start
{
  PKPaymentAuthorizationFlowCoordinator *v3;
  PKPaymentAuthorizationFlowCoordinator *flowCoordinator;
  PKPaymentAuthorizationContext *v5;

  v5 = -[PKPaymentAuthorizationContext initWithUserInfo:]([PKPaymentAuthorizationContext alloc], "initWithUserInfo:", self->_hostUserInfo);
  v3 = -[PKPaymentAuthorizationFlowCoordinator initWithContext:scenePresenter:delegate:]([PKPaymentAuthorizationFlowCoordinator alloc], "initWithContext:scenePresenter:delegate:", v5, self, self);
  flowCoordinator = self->_flowCoordinator;
  self->_flowCoordinator = v3;

  -[PKPaymentAuthorizationFlowCoordinator start](self->_flowCoordinator, "start");
}

- (void)requestSecondaryViewControllerPresenterIfNecessary
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  id v7;
  id v8;
  SBSRemoteAlertHandle *v9;
  SBSRemoteAlertHandle *secondaryTargetAlertHandle;
  id v11;

  if (self->_shouldRequestSecondaryViewControllerPresenter && !self->_secondaryTargetAlertHandle)
  {
    v3 = objc_alloc(MEMORY[0x1E0DAAF78]);
    v4 = *MEMORY[0x1E0D6AB70];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v3, "initWithServiceName:viewControllerClassName:", v4, v6);

    objc_msgSend(v11, "setPrefersEmbeddedDisplayPresentation:", 1);
    v7 = objc_alloc_init(MEMORY[0x1E0DAAF70]);
    objc_msgSend(v7, "setUserInfo:", self->_hostUserInfo);
    v8 = objc_alloc_init(MEMORY[0x1E0DAAF58]);
    objc_msgSend(v8, "setActivatingForSiri:", 1);
    objc_msgSend(v8, "setShouldStashPictureInPictureIfNeeded:", 1);
    v9 = (SBSRemoteAlertHandle *)objc_msgSend(MEMORY[0x1E0DAAF88], "newHandleWithDefinition:configurationContext:", v11, v7);
    secondaryTargetAlertHandle = self->_secondaryTargetAlertHandle;
    self->_secondaryTargetAlertHandle = v9;

    -[SBSRemoteAlertHandle registerObserver:](self->_secondaryTargetAlertHandle, "registerObserver:", self);
    -[SBSRemoteAlertHandle activateWithContext:](self->_secondaryTargetAlertHandle, "activateWithContext:", v8);

  }
}

- (void)invalidateSecondaryAlert
{
  SBSRemoteAlertHandle *secondaryTargetAlertHandle;

  -[SBSRemoteAlertHandle invalidate](self->_secondaryTargetAlertHandle, "invalidate");
  secondaryTargetAlertHandle = self->_secondaryTargetAlertHandle;
  self->_secondaryTargetAlertHandle = 0;

}

- (void)viewControllerDidInvalidate:(id)a3
{
  PKPaymentAuthorizationPresentationTarget *primaryTarget;
  id v5;
  id v6;

  primaryTarget = self->_primaryTarget;
  v5 = a3;
  -[PKPaymentAuthorizationPresentationTarget presentingViewController](primaryTarget, "presentingViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    -[PKPaymentAuthorizationPresentersCoordinator invalidate](self, "invalidate");
}

- (void)notifyOnInvalidated:(id)a3
{
  -[PKAsyncTaskProgressTracker notifyOnCompletion:](self->_invalidationTracker, "notifyOnCompletion:", a3);
}

- (void)askForDismissalWithReason:(unint64_t)a3 error:(id)a4 completion:(id)a5
{
  void (**v8)(_QWORD);
  PKPaymentAuthorizationFlowCoordinator *flowCoordinator;
  id v10;

  v10 = a4;
  v8 = (void (**)(_QWORD))a5;
  flowCoordinator = self->_flowCoordinator;
  if (flowCoordinator)
  {
    -[PKPaymentAuthorizationFlowCoordinator dismissWithReason:error:completion:](flowCoordinator, "dismissWithReason:error:completion:", a3, v10, v8);
  }
  else if (v8)
  {
    v8[2](v8);
  }

}

- (void)presentPrimaryViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[PKPaymentAuthorizationPresentationTarget presentViewController:animated:completion:](self->_primaryTarget, "presentViewController:animated:completion:", a3, a4, a5);
}

- (BOOL)supportsSecondaryViewController
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[PKPaymentAuthorizationPresentationTarget presentingViewController](self->_primaryTarget, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMainDisplay");

  return v5 ^ 1;
}

- (void)presentSecondaryViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  PKPaymentAuthorizationPresentationTarget *v10;
  PKPaymentAuthorizationPresentationTarget *secondaryTarget;
  NSObject *v12;
  uint8_t v13[16];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (-[PKPaymentAuthorizationPresentersCoordinator supportsSecondaryViewController](self, "supportsSecondaryViewController"))
  {
    if (!self->_secondaryTarget)
    {
      v10 = objc_alloc_init(PKPaymentAuthorizationPresentationTarget);
      secondaryTarget = self->_secondaryTarget;
      self->_secondaryTarget = v10;

    }
    -[PKPaymentAuthorizationPresentersCoordinator requestSecondaryViewControllerPresenterIfNecessary](self, "requestSecondaryViewControllerPresenterIfNecessary");
    -[PKPaymentAuthorizationPresentationTarget presentViewController:animated:completion:](self->_secondaryTarget, "presentViewController:animated:completion:", v8, v6, v9);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "PKPaymentAuthorizationPresentersCoordinator: secondary view controller requested but the current scene doesn't support it.", v13, 2u);
    }

  }
}

- (void)dismissSecondaryViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void (**v8)(_QWORD);
  PKPaymentAuthorizationPresentationTarget *secondaryTarget;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  PKPaymentAuthorizationPresentersCoordinator *v14;
  id v15;

  v4 = a3;
  v6 = a4;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __97__PKPaymentAuthorizationPresentersCoordinator_dismissSecondaryViewControllerAnimated_completion___block_invoke;
  v13 = &unk_1E3E618A0;
  v7 = v6;
  v14 = self;
  v15 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(&v10);
  secondaryTarget = self->_secondaryTarget;
  if (secondaryTarget)
    -[PKPaymentAuthorizationPresentationTarget dismissViewControllerAnimated:completion:](secondaryTarget, "dismissViewControllerAnimated:completion:", v4, v8, v10, v11, v12, v13);
  else
    v8[2](v8);

}

uint64_t __97__PKPaymentAuthorizationPresentersCoordinator_dismissSecondaryViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidateSecondaryAlert");
}

- (void)dismissSceneAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  PKPaymentAuthorizationPresentationTarget *primaryTarget;
  uint64_t v9;
  NSObject *v10;
  PKPaymentAuthorizationPresentationTarget *secondaryTarget;
  _QWORD v12[4];
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;

  v4 = a3;
  v6 = a4;
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  primaryTarget = self->_primaryTarget;
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__PKPaymentAuthorizationPresentersCoordinator_dismissSceneAnimated_completion___block_invoke;
  v14[3] = &unk_1E3E612E8;
  v10 = v7;
  v15 = v10;
  -[PKPaymentAuthorizationPresentationTarget dismissViewControllerAnimated:completion:](primaryTarget, "dismissViewControllerAnimated:completion:", v4, v14);
  if (self->_secondaryTarget)
  {
    dispatch_group_enter(v10);
    secondaryTarget = self->_secondaryTarget;
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __79__PKPaymentAuthorizationPresentersCoordinator_dismissSceneAnimated_completion___block_invoke_2;
    v12[3] = &unk_1E3E612E8;
    v13 = v10;
    -[PKPaymentAuthorizationPresentationTarget dismissViewControllerAnimated:completion:](secondaryTarget, "dismissViewControllerAnimated:completion:", v4, v12);

  }
  if (v6)
    dispatch_group_notify(v10, MEMORY[0x1E0C80D38], v6);

}

void __79__PKPaymentAuthorizationPresentersCoordinator_dismissSceneAnimated_completion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __79__PKPaymentAuthorizationPresentersCoordinator_dismissSceneAnimated_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)viewControllerWillAppear:(id)a3
{
  PKPaymentAuthorizationPresentationTarget *primaryTarget;
  id v5;
  id v6;

  primaryTarget = self->_primaryTarget;
  v5 = a3;
  -[PKPaymentAuthorizationPresentationTarget presentingViewController](primaryTarget, "presentingViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    -[PKPaymentAuthorizationFlowCoordinator willAppear](self->_flowCoordinator, "willAppear");
}

- (void)viewControllerWillDisappear:(id)a3
{
  PKPaymentAuthorizationPresentationTarget *primaryTarget;
  id v5;
  id v6;

  primaryTarget = self->_primaryTarget;
  v5 = a3;
  -[PKPaymentAuthorizationPresentationTarget presentingViewController](primaryTarget, "presentingViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    -[PKPaymentAuthorizationFlowCoordinator willDisappear](self->_flowCoordinator, "willDisappear");
}

- (BOOL)handleHomeButtonPressedInViewController:(id)a3
{
  return -[PKPaymentAuthorizationFlowCoordinator handleHomeButtonPressed](self->_flowCoordinator, "handleHomeButtonPressed", a3);
}

- (NSDictionary)hostUserInfo
{
  return self->_hostUserInfo;
}

- (void)setHostUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PKPaymentAuthorizationPresentationTarget)primaryTarget
{
  return self->_primaryTarget;
}

- (void)setPrimaryTarget:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTarget, a3);
}

- (PKPaymentAuthorizationPresentationTarget)secondaryTarget
{
  return self->_secondaryTarget;
}

- (void)setSecondaryTarget:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTarget, a3);
}

- (SBSRemoteAlertHandle)secondaryTargetAlertHandle
{
  return self->_secondaryTargetAlertHandle;
}

- (void)setSecondaryTargetAlertHandle:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTargetAlertHandle, a3);
}

- (PKPaymentAuthorizationFlowCoordinator)flowCoordinator
{
  return self->_flowCoordinator;
}

- (void)setFlowCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_flowCoordinator, a3);
}

- (PKAsyncTaskProgressTracker)invalidationTracker
{
  return self->_invalidationTracker;
}

- (void)setInvalidationTracker:(id)a3
{
  objc_storeStrong((id *)&self->_invalidationTracker, a3);
}

- (BOOL)shouldRequestSecondaryViewControllerPresenter
{
  return self->_shouldRequestSecondaryViewControllerPresenter;
}

- (void)setShouldRequestSecondaryViewControllerPresenter:(BOOL)a3
{
  self->_shouldRequestSecondaryViewControllerPresenter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationTracker, 0);
  objc_storeStrong((id *)&self->_flowCoordinator, 0);
  objc_storeStrong((id *)&self->_secondaryTargetAlertHandle, 0);
  objc_storeStrong((id *)&self->_secondaryTarget, 0);
  objc_storeStrong((id *)&self->_primaryTarget, 0);
  objc_storeStrong((id *)&self->_hostUserInfo, 0);
}

@end
