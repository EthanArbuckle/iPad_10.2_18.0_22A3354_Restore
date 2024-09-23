@implementation PXCMMWorkflowCoordinator

- (id)workflowViewControllerWithContext:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "createSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMWorkflowCoordinator workflowViewControllerWithSession:embedInNavigationControllerOfClass:assetActionManager:assetCollectionActionManager:photosViewConfigurationBlock:](self, "workflowViewControllerWithSession:embedInNavigationControllerOfClass:assetActionManager:assetCollectionActionManager:photosViewConfigurationBlock:", v4, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)workflowViewControllerWithContext:(id)a3 embedInNavigationControllerOfClass:(Class)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "createSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMWorkflowCoordinator workflowViewControllerWithSession:embedInNavigationControllerOfClass:assetActionManager:assetCollectionActionManager:photosViewConfigurationBlock:](self, "workflowViewControllerWithSession:embedInNavigationControllerOfClass:assetActionManager:assetCollectionActionManager:photosViewConfigurationBlock:", v6, a4, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)workflowViewControllerWithContext:(id)a3 embedInNavigationControllerOfClass:(Class)a4 photosViewConfigurationBlock:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a5;
  objc_msgSend(a3, "createSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMWorkflowCoordinator workflowViewControllerWithSession:embedInNavigationControllerOfClass:assetActionManager:assetCollectionActionManager:photosViewConfigurationBlock:](self, "workflowViewControllerWithSession:embedInNavigationControllerOfClass:assetActionManager:assetCollectionActionManager:photosViewConfigurationBlock:", v9, a4, 0, 0, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)workflowViewControllerWithSession:(id)a3 embedInNavigationControllerOfClass:(Class)a4 assetActionManager:(id)a5 assetCollectionActionManager:(id)a6 photosViewConfigurationBlock:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  UINavigationController *navigationController;
  UIViewController *v18;
  PXCMMGridController *gridController;
  UIViewController *rootWorkflowViewController;
  PXCMMSession *rootWorkflowSession;
  UIViewController *v22;
  UIViewController *v23;
  void *v24;
  void *v25;
  UINavigationController *v26;
  UINavigationController *v27;
  UINavigationController *v28;
  UINavigationController *v29;
  void *v31;
  void *v32;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v13)
  {
    if (!a4)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMWorkflowCoordinator.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("session"));

    if (!a4)
      goto LABEL_5;
  }
  if ((-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMWorkflowCoordinator.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!navigationControllerClass || [navigationControllerClass isSubclassOfClass:[UINavigationController class]]"));

  }
LABEL_5:
  if (self->_rootWorkflowViewController)
  {
    navigationController = self->_navigationController;
    self->_navigationController = 0;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = self->_rootWorkflowViewController;
      -[UIViewController setDelegate:](v18, "setDelegate:", 0);
      -[UIViewController setActionDelegate:](v18, "setActionDelegate:", 0);

    }
    gridController = self->_gridController;
    self->_gridController = 0;

    rootWorkflowViewController = self->_rootWorkflowViewController;
    self->_rootWorkflowViewController = 0;

    rootWorkflowSession = self->_rootWorkflowSession;
    self->_rootWorkflowSession = 0;

  }
  -[PXCMMWorkflowCoordinator _createRootWorkflowViewControllerWithSession:willBeEmbeddedInNavigationController:assetActionManager:assetCollectionActionManager:photosViewConfigurationBlock:](self, "_createRootWorkflowViewControllerWithSession:willBeEmbeddedInNavigationController:assetActionManager:assetCollectionActionManager:photosViewConfigurationBlock:", v13, a4 != 0, v14, v15, v16);
  v22 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  v23 = self->_rootWorkflowViewController;
  self->_rootWorkflowViewController = v22;

  if (a4)
  {
    -[UIViewController navigationItem](self->_rootWorkflowViewController, "navigationItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_cancelWorkflow);
    objc_msgSend(v24, "setLeftBarButtonItem:", v25);
    v26 = (UINavigationController *)objc_msgSend([a4 alloc], "initWithRootViewController:", self->_rootWorkflowViewController);
    v27 = self->_navigationController;
    self->_navigationController = v26;

    -[UINavigationController setModalPresentationStyle:](self->_navigationController, "setModalPresentationStyle:", 0);
  }
  v28 = self->_navigationController;
  if (!v28)
    v28 = (UINavigationController *)self->_rootWorkflowViewController;
  v29 = v28;

  return v29;
}

- (void)cancelWorkflow
{
  void *v4;

  if (!self->_rootWorkflowViewController)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMWorkflowCoordinator.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_rootWorkflowViewController"));

  }
  -[PXCMMWorkflowCoordinator _didFinishSession:withState:](self, "_didFinishSession:withState:", self->_rootWorkflowSession, 2);
}

- (void)performQuickSaveForContext:(id)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a4;
  objc_msgSend(a3, "createSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionPerformerForActionType:", CFSTR("PXCMMActionTypeSaveToLibrary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performChanges:", &__block_literal_global_293674);

  v10 = (id)objc_msgSend(v7, "performActionWithSession:completionHandler:", v5, v11);
}

- (id)_performActionWithType:(id)a3 forSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "actionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionPerformerForActionType:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62__PXCMMWorkflowCoordinator__performActionWithType_forSession___block_invoke;
    v13[3] = &unk_1E51472F8;
    objc_copyWeak(&v15, &location);
    v14 = v7;
    objc_msgSend(v9, "performActionWithSession:completionHandler:", v14, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("PXCMMErrorDomain"), -1000, 0, CFSTR("No performer for action type: \"%@\", session: %@"), v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMWorkflowCoordinator _completeActionForSession:withSuccess:error:](self, "_completeActionForSession:withSuccess:error:", v7, 0, v11);

    v10 = 0;
  }

  return v10;
}

- (id)_performPublishActionForSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  objc_msgSend(v4, "actionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "publishActionPerformer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PXCMMWorkflowCoordinator delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = objc_msgSend(v7, "shareOriginForSession:workflowCoordinator:", v4, self);
    else
      v8 = 0;
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__PXCMMWorkflowCoordinator__performPublishActionForSession___block_invoke;
    v12[3] = &unk_1E5147320;
    objc_copyWeak(&v14, &location);
    v13 = v4;
    objc_msgSend(v6, "performPublishActionWithSession:shareOrigin:completionHandler:", v13, v8, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("PXCMMErrorDomain"), -1000, 0, CFSTR("No performer for publish action, session: %@"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMWorkflowCoordinator _completeActionForSession:withSuccess:error:](self, "_completeActionForSession:withSuccess:error:", v4, 0, v9);

    v10 = 0;
  }

  return v10;
}

- (id)_performDeleteActionForSession:(id)a3
{
  return -[PXCMMWorkflowCoordinator _performActionWithType:forSession:](self, "_performActionWithType:forSession:", CFSTR("PXCMMActionTypeDelete"), a3);
}

- (void)_performMessageComposeActionForSession:(id)a3 shareURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "actionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageComposeActionPerformer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __76__PXCMMWorkflowCoordinator__performMessageComposeActionForSession_shareURL___block_invoke;
    v11[3] = &unk_1E51472F8;
    objc_copyWeak(&v13, &location);
    v12 = v6;
    objc_msgSend(v9, "performMessageComposeActionWithSession:shareURL:completionHandler:", v12, v7, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("PXCMMErrorDomain"), -1000, 0, CFSTR("No performer for message compose action, session: %@"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMWorkflowCoordinator _completeActionForSession:withSuccess:error:](self, "_completeActionForSession:withSuccess:error:", v6, 0, v10);

  }
}

- (void)_performPhotosPickerActionForSession:(id)a3 gridPresentation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "actionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photosPickerActionPerformer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __82__PXCMMWorkflowCoordinator__performPhotosPickerActionForSession_gridPresentation___block_invoke;
    v11[3] = &unk_1E51472F8;
    objc_copyWeak(&v13, &location);
    v12 = v6;
    objc_msgSend(v9, "performPhotosPickerActionWithSession:gridPresentation:completionHandler:", v12, v7, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("PXCMMErrorDomain"), -1000, 0, CFSTR("No performer for photos picker action, session: %@"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMWorkflowCoordinator _completePhotosPickerActionForSession:withSuccess:error:](self, "_completePhotosPickerActionForSession:withSuccess:error:", v6, 0, v10);

  }
}

- (id)_performReceiveActionForSession:(id)a3
{
  return -[PXCMMWorkflowCoordinator _performActionWithType:forSession:](self, "_performActionWithType:forSession:", CFSTR("PXCMMActionTypeSaveToLibrary"), a3);
}

- (void)_performCleanupActionForSession:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "actionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionPerformerForActionType:", CFSTR("PXCMMActionTypeCleanup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "canPerformActionWithSession:", v3))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__PXCMMWorkflowCoordinator__performCleanupActionForSession___block_invoke;
    v8[3] = &unk_1E5148B78;
    v9 = v3;
    v6 = (id)objc_msgSend(v5, "performActionWithSession:completionHandler:", v9, v8);
    v7 = v9;
  }
  else
  {
    PLSharingGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v3;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "Unable to perform cleanup action. Skipping for session: %@", buf, 0xCu);
    }
  }

}

- (void)_performNotifyIfNeededActionForSession:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "actionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionPerformerForActionType:", CFSTR("PXCMMActionTypeNotifyWhenReadyIfNeeded"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "canPerformActionWithSession:", v3))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__PXCMMWorkflowCoordinator__performNotifyIfNeededActionForSession___block_invoke;
    v8[3] = &unk_1E5148B78;
    v9 = v3;
    v6 = (id)objc_msgSend(v5, "performActionWithSession:completionHandler:", v9, v8);
    v7 = v9;
  }
  else
  {
    PLSharingGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v3;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "Unable to perform notify if needed action. Skipping for session: %@", buf, 0xCu);
    }
  }

}

- (void)_didFinishSession:(id)a3 withState:(unint64_t)a4
{
  -[PXCMMWorkflowCoordinator _didFinishSession:withState:avoidDismissal:](self, "_didFinishSession:withState:avoidDismissal:", a3, a4, 1);
}

- (void)_didFinishSession:(id)a3 withState:(unint64_t)a4 avoidDismissal:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  uint64_t v10;
  NSObject *v11;
  unint64_t v12;
  UINavigationController *navigationController;
  unint64_t v14;
  UIViewController *v15;
  UIViewController *rootWorkflowViewController;
  PXCMMSession *rootWorkflowSession;
  PXCMMGridController *gridController;
  void *v19;
  unint64_t v20;
  void *v21;
  uint8_t buf[16];

  v5 = a5;
  v9 = a3;
  v10 = objc_msgSend(v9, "activityType");
  if (a4 != 2 && v5 && v10 == 2)
  {
    PLSharingGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "Staying in receiving VC after session finished.", buf, 2u);
    }

  }
  else
  {
    if (a4 == 1 || v10 != 1)
    {
      if (v10 == 2)
        -[PXCMMWorkflowCoordinator _performNotifyIfNeededActionForSession:](self, "_performNotifyIfNeededActionForSession:", v9);
    }
    else
    {
      -[PXCMMWorkflowCoordinator _performCleanupActionForSession:](self, "_performCleanupActionForSession:", v9);
    }
    v12 = self->_navigationController;
    navigationController = self->_navigationController;
    self->_navigationController = 0;

    v14 = self->_rootWorkflowViewController;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (UIViewController *)(id)v14;
      -[UIViewController setDelegate:](v15, "setDelegate:", 0);
      -[UIViewController setActionDelegate:](v15, "setActionDelegate:", 0);

    }
    rootWorkflowViewController = self->_rootWorkflowViewController;
    self->_rootWorkflowViewController = 0;

    rootWorkflowSession = self->_rootWorkflowSession;
    self->_rootWorkflowSession = 0;

    gridController = self->_gridController;
    self->_gridController = 0;

    -[PXCMMWorkflowCoordinator delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (!(v12 | v14))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMWorkflowCoordinator.m"), 295, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("navigationController || workflowViewController"));

      }
      if (v12)
        v20 = v12;
      else
        v20 = v14;
      objc_msgSend(v19, "workflowCoordinator:workflowViewController:didFinishSession:withActivityState:", self, v20, v9, a4);
    }

  }
}

- (void)_completePublishForSession:(id)a3 withURL:(id)a4 error:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a4;
  if (v8)
  {
    -[PXCMMWorkflowCoordinator delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "workflowCoordinator:didPublishToURL:", self, v8);
      -[PXCMMWorkflowCoordinator _completeActionForSession:withSuccess:error:](self, "_completeActionForSession:withSuccess:error:", v10, 1, 0);
    }
    if (objc_msgSend(v10, "activityType") == 1 && !objc_msgSend(v10, "sourceType"))
      -[PXCMMWorkflowCoordinator _performMessageComposeActionForSession:shareURL:](self, "_performMessageComposeActionForSession:shareURL:", v10, v8);

  }
  else
  {
    -[PXCMMWorkflowCoordinator _completeActionForSession:withSuccess:error:](self, "_completeActionForSession:withSuccess:error:", v10, 0, a5);
  }

}

- (void)_completePhotosPickerActionForSession:(id)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  if (!a4)
  {
    PLSharingGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Photos Picker action failed with error: %@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)_completeMessageComposeActionForSession:(id)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v5 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  if (!v5)
  {
    objc_msgSend(v8, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("PXCMMErrorDomain")))
    {
      v11 = objc_msgSend(v8, "code");

      if (v11 == -1007)
      {
        PLSharingGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "User cancelled message composition", buf, 2u);
        }
LABEL_11:

        -[PXCMMWorkflowCoordinator _performCleanupActionForSession:](self, "_performCleanupActionForSession:", v9);
        goto LABEL_12;
      }
    }
    else
    {

    }
    PLSharingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Message compose failed with error: %@", buf, 0xCu);
    }

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __86__PXCMMWorkflowCoordinator__completeMessageComposeActionForSession_withSuccess_error___block_invoke;
    v14[3] = &unk_1E5147360;
    v15 = v8;
    -[PXCMMWorkflowCoordinator _presentFailureForSession:error:completionHandler:](self, "_presentFailureForSession:error:completionHandler:", v9, v15, v14);
    v12 = v15;
    goto LABEL_11;
  }
  -[PXCMMWorkflowCoordinator _completeActionForSession:withSuccess:error:](self, "_completeActionForSession:withSuccess:error:", v9, 1, v8);
LABEL_12:

}

- (void)_completeActionForSession:(id)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v6 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v6)
  {
    -[PXCMMWorkflowCoordinator _didFinishSession:withState:](self, "_didFinishSession:withState:", v8, 1);
  }
  else
  {
    PLSharingGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Action failed with error: %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__PXCMMWorkflowCoordinator__completeActionForSession_withSuccess_error___block_invoke;
    v11[3] = &unk_1E5147388;
    objc_copyWeak(&v13, (id *)buf);
    v12 = v8;
    -[PXCMMWorkflowCoordinator _presentFailureForSession:error:completionHandler:](self, "_presentFailureForSession:error:completionHandler:", v12, v9, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }

}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  os_signpost_id_t v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PXCMMWorkflowCoordinator _presentingViewControllerForViewController:](self, "_presentingViewControllerForViewController:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLSharingGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "Performer: %@ Presenting Action Performer View Controller", buf, 0xCu);
  }

  PLSharingGetLog();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_make_with_pointer(v10, self);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v12 = v11;
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "ActionPerformerPresentation", " enableTelemetry=YES ", buf, 2u);
    }
  }

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__PXCMMWorkflowCoordinator_actionPerformer_presentViewController___block_invoke;
  v15[3] = &unk_1E5148D08;
  v15[4] = self;
  v16 = v6;
  v13 = v6;
  objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, v15);

  return 1;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = v7;
  -[PXCMMWorkflowCoordinator _presentingViewControllerForViewController:](self, "_presentingViewControllerForViewController:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentedViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 == v9)
  {
    objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, v8);
  }
  else
  {
    PLSharingGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412802;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Unexpected view controller presented from %@: %@ (expected: %@)", (uint8_t *)&v14, 0x20u);
    }

  }
  return v11 == v9;
}

- (id)undoManagerForActionPerformer:(id)a3
{
  return (id)-[UIViewController undoManager](self->_rootWorkflowViewController, "undoManager", a3);
}

- (id)completeMyMomentViewController:(id)a3 performActionForSession:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v13;

  v7 = a3;
  v8 = a4;
  switch(objc_msgSend(v8, "activityType"))
  {
    case 0:
    case 4:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMWorkflowCoordinator.m"), 421, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
      -[PXCMMWorkflowCoordinator _performPublishActionForSession:](self, "_performPublishActionForSession:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      -[PXCMMWorkflowCoordinator _performReceiveActionForSession:](self, "_performReceiveActionForSession:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      v10 = objc_msgSend(v8, "sourceType");
      if (v10 == 1)
      {
        -[PXCMMWorkflowCoordinator _didFinishSession:withState:](self, "_didFinishSession:withState:", v8, 1);
        goto LABEL_9;
      }
      if (v10)
      {
LABEL_9:
        v11 = 0;
        goto LABEL_10;
      }
      -[PXCMMWorkflowCoordinator _performDeleteActionForSession:](self, "_performDeleteActionForSession:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v11 = (void *)v9;
LABEL_10:

      return v11;
    default:
      goto LABEL_9;
  }
}

- (void)_session:(id)a3 finishedAccepting:(BOOL)a4 withError:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v6 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMWorkflowCoordinator.m"), 430, CFSTR("%s must be called on the main thread"), "-[PXCMMWorkflowCoordinator _session:finishedAccepting:withError:]");

  }
  PLSharingGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v6)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "CMM workflow finished accepting moment share.", buf, 2u);
    }

  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v10;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "CMM workflow failed to accept moment share: %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __65__PXCMMWorkflowCoordinator__session_finishedAccepting_withError___block_invoke;
    v14[3] = &unk_1E5147388;
    objc_copyWeak(&v16, (id *)buf);
    v15 = v9;
    -[PXCMMWorkflowCoordinator _presentFailureForSession:error:completionHandler:](self, "_presentFailureForSession:error:completionHandler:", v15, v10, v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }

}

- (void)startPreloadingTasksForCompleteMyMomentViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  objc_msgSend(v4, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionPerformerForActionType:", CFSTR("PXCMMActionTypeAccept"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "canPerformActionWithSession:", v5))
  {
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __82__PXCMMWorkflowCoordinator_startPreloadingTasksForCompleteMyMomentViewController___block_invoke;
    v14[3] = &unk_1E51472F8;
    objc_copyWeak(&v16, &location);
    v15 = v5;
    v8 = (id)objc_msgSend(v7, "performActionWithSession:completionHandler:", v15, v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  objc_msgSend(v5, "actionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionPerformerForActionType:", CFSTR("PXCMMActionTypeForceSync"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "canPerformActionWithSession:", v5))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __82__PXCMMWorkflowCoordinator_startPreloadingTasksForCompleteMyMomentViewController___block_invoke_2;
    v12[3] = &unk_1E5148B78;
    v13 = v5;
    v11 = (id)objc_msgSend(v10, "performActionWithSession:completionHandler:", v13, v12);

  }
}

- (void)didCancelCompleteMyMomentViewController:(id)a3
{
  id v4;

  objc_msgSend(a3, "session");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXCMMWorkflowCoordinator _didFinishSession:withState:](self, "_didFinishSession:withState:", v4, 2);

}

- (void)completeMyMomentViewController:(id)a3 showPhotoPickerForSession:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v6 = a4;
  objc_msgSend(a3, "px_gridPresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PXCMMWorkflowCoordinator _performPhotosPickerActionForSession:gridPresentation:](self, "_performPhotosPickerActionForSession:gridPresentation:", v6, v7);
  }
  else
  {
    PLSharingGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Unable to find grid presentation for CMM workflow", v10, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXCMMErrorDomain"), -1003, CFSTR("A grid presentation object is required to display the photos picker"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMWorkflowCoordinator _completePhotosPickerActionForSession:withSuccess:error:](self, "_completePhotosPickerActionForSession:withSuccess:error:", v6, 0, v9);

  }
}

- (id)_presentationEnvironment
{
  void *v2;
  void *v3;

  -[PXCMMWorkflowCoordinator _presentingViewControllerForViewController:](self, "_presentingViewControllerForViewController:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXViewControllerPresenter defaultPresenterWithViewController:](PXViewControllerPresenter, "defaultPresenterWithViewController:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_presentFailureForSession:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _BOOL4 v12;
  void *v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = objc_msgSend(a3, "activityType");
  v12 = v10 == 1 || v10 == 4;
  -[PXCMMWorkflowCoordinator _presentationEnvironment](self, "_presentationEnvironment");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PXMomentSharePresentFailureForAction(v13, v12, v9, v14, v8);

}

- (id)_createRootWorkflowViewControllerWithSession:(id)a3 willBeEmbeddedInNavigationController:(BOOL)a4 assetActionManager:(id)a5 assetCollectionActionManager:(id)a6 photosViewConfigurationBlock:(id)a7
{
  _BOOL8 v10;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _BOOL4 v18;
  PXCMMViewController *v19;
  PXCMMGridController *v20;
  PXCMMGridController *gridController;

  v10 = a4;
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v13, "actionManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPerformerDelegate:", self);

  objc_storeStrong((id *)&self->_rootWorkflowSession, a3);
  v18 = +[PXCMMGridController useGridZeroForCMMSession:](PXCMMGridController, "useGridZeroForCMMSession:", v13);
  if (v16 || v18)
  {
    v20 = -[PXCMMGridController initWithCMMSession:enableDismissAction:assetActionManager:assetCollectionActionManager:performerDelegate:photosViewConfigurationBlock:]([PXCMMGridController alloc], "initWithCMMSession:enableDismissAction:assetActionManager:assetCollectionActionManager:performerDelegate:photosViewConfigurationBlock:", v13, v10, v14, v15, self, v16);
    gridController = self->_gridController;
    self->_gridController = v20;

    -[PXCMMGridController gridViewController](self->_gridController, "gridViewController");
    v19 = (PXCMMViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = -[PXCMMViewController initWithSession:]([PXCMMViewController alloc], "initWithSession:", v13);
    -[PXCMMViewController setDelegate:](v19, "setDelegate:", self);
    -[PXCMMViewController setActionDelegate:](v19, "setActionDelegate:", self);
  }

  return v19;
}

- (id)_presentingViewControllerForViewController:(id)a3
{
  id v4;
  UIViewController *v5;
  uint64_t v6;
  id v7;
  BOOL v8;
  UIViewController *v9;

  v4 = a3;
  v5 = self->_rootWorkflowViewController;
  -[UIViewController presentedViewController](v5, "presentedViewController");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v6;
  if (v6)
    v8 = v6 == (_QWORD)v4;
  else
    v8 = 1;
  if (!v8)
  {
    do
    {
      v9 = v5;
      v5 = (UIViewController *)v7;

      -[UIViewController presentedViewController](v5, "presentedViewController");
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    while (v7 && v7 != v4);
  }

  return v5;
}

- (PXCMMWorkflowCoordinatorDelegate)delegate
{
  return (PXCMMWorkflowCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rootWorkflowSession, 0);
  objc_storeStrong((id *)&self->_rootWorkflowViewController, 0);
  objc_storeStrong((id *)&self->_gridController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

void __82__PXCMMWorkflowCoordinator_startPreloadingTasksForCompleteMyMomentViewController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_session:finishedAccepting:withError:", *(_QWORD *)(a1 + 32), a2, v6);

}

void __82__PXCMMWorkflowCoordinator_startPreloadingTasksForCompleteMyMomentViewController___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      v8 = "Successfully forced sync on moment share";
      v9 = v7;
      v10 = OS_LOG_TYPE_DEFAULT;
      v11 = 2;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v9, v10, v8, (uint8_t *)&v13, v11);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = 138412546;
    v14 = v12;
    v15 = 2112;
    v16 = v5;
    v8 = "Failed to force sync on moment share from session %@ with error: %@";
    v9 = v7;
    v10 = OS_LOG_TYPE_ERROR;
    v11 = 22;
    goto LABEL_6;
  }

}

void __65__PXCMMWorkflowCoordinator__session_finishedAccepting_withError___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didFinishSession:withState:avoidDismissal:", *(_QWORD *)(a1 + 32), 3, a2);

}

void __66__PXCMMWorkflowCoordinator_actionPerformer_presentViewController___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  os_signpost_id_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLSharingGetLog();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v3;
    if (os_signpost_enabled(v2))
    {
      LOWORD(v7) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v2, OS_SIGNPOST_INTERVAL_END, v4, "ActionPerformerPresentation", " enableTelemetry=YES ", (uint8_t *)&v7, 2u);
    }
  }

  PLSharingGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Performer: %@ Presented Action Performer View Controller", (uint8_t *)&v7, 0xCu);
  }

}

void __72__PXCMMWorkflowCoordinator__completeActionForSession_withSuccess_error___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didFinishSession:withState:", *(_QWORD *)(a1 + 32), 3);

}

void __86__PXCMMWorkflowCoordinator__completeMessageComposeActionForSession_withSuccess_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PLSharingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "User confirmed Message compose error alert for error %@", (uint8_t *)&v4, 0xCu);
  }

}

void __67__PXCMMWorkflowCoordinator__performNotifyIfNeededActionForSession___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v14 = 138412290;
      v15 = v8;
      v9 = "Successfully completed notify if needed action for session: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v10, v11, v9, (uint8_t *)&v14, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = 138412546;
    v15 = v13;
    v16 = 2112;
    v17 = v5;
    v9 = "Failed to mark moment share as needing notification when ready for session %@ - error: %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
    goto LABEL_6;
  }

}

void __60__PXCMMWorkflowCoordinator__performCleanupActionForSession___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v14 = 138412290;
      v15 = v8;
      v9 = "Successfully cleaned up CMM share for session: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v10, v11, v9, (uint8_t *)&v14, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = 138412546;
    v15 = v13;
    v16 = 2112;
    v17 = v5;
    v9 = "Failed to clean up for session %@ - error: %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
    goto LABEL_6;
  }

}

void __82__PXCMMWorkflowCoordinator__performPhotosPickerActionForSession_gridPresentation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_completePhotosPickerActionForSession:withSuccess:error:", *(_QWORD *)(a1 + 32), a2, v6);

}

void __76__PXCMMWorkflowCoordinator__performMessageComposeActionForSession_shareURL___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_completeMessageComposeActionForSession:withSuccess:error:", *(_QWORD *)(a1 + 32), a2, v6);

}

void __60__PXCMMWorkflowCoordinator__performPublishActionForSession___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_completePublishForSession:withURL:error:", *(_QWORD *)(a1 + 32), v7, v6);

}

void __62__PXCMMWorkflowCoordinator__performActionWithType_forSession___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_completeActionForSession:withSuccess:error:", *(_QWORD *)(a1 + 32), a2, v6);

}

uint64_t __66__PXCMMWorkflowCoordinator_performQuickSaveForContext_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "selectAllItems");
}

@end
