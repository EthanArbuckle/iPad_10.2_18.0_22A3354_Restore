@implementation PXCMMWorkflowCoordinatorPresenter

- (PXCMMWorkflowCoordinatorPresenter)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMWorkflowCoordinatorPresenter.m"), 34, CFSTR("%s is not available as initializer"), "-[PXCMMWorkflowCoordinatorPresenter init]");

  abort();
}

- (PXCMMWorkflowCoordinatorPresenter)initWithNavigationHelper:(id)a3
{
  id v6;
  PXCMMWorkflowCoordinatorPresenter *v7;
  PXCMMWorkflowCoordinatorPresenter *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMWorkflowCoordinatorPresenter.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("navigationHelper"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXCMMWorkflowCoordinatorPresenter;
  v7 = -[PXCMMWorkflowCoordinatorPresenter init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_navigationHelper, a3);

  return v8;
}

- (id)workflowViewControllerWithContext:(id)a3
{
  id v4;
  PXCMMWorkflowCoordinator *workflowCoordinator;
  PXCMMWorkflowCoordinator *v6;
  PXCMMWorkflowCoordinator *v7;
  void *v8;

  v4 = a3;
  workflowCoordinator = self->_workflowCoordinator;
  if (!workflowCoordinator)
  {
    v6 = objc_alloc_init(PXCMMWorkflowCoordinator);
    v7 = self->_workflowCoordinator;
    self->_workflowCoordinator = v6;

    -[PXCMMWorkflowCoordinator setDelegate:](self->_workflowCoordinator, "setDelegate:", self);
    workflowCoordinator = self->_workflowCoordinator;
  }
  -[PXCMMWorkflowCoordinator workflowViewControllerWithContext:](workflowCoordinator, "workflowViewControllerWithContext:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)cancelWorkflow
{
  -[PXCMMWorkflowCoordinator cancelWorkflow](self->_workflowCoordinator, "cancelWorkflow");
}

- (int64_t)shareOriginForSession:(id)a3 workflowCoordinator:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  int64_t v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "activityType");
  if (v9 == 1)
  {
    v10 = 1;
  }
  else
  {
    if ((unint64_t)(v9 - 2) < 3 || !v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMWorkflowCoordinatorPresenter.m"), 75, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v10 = 0;
  }

  return v10;
}

- (void)workflowCoordinator:(id)a3 workflowViewController:(id)a4 didFinishSession:(id)a5 withActivityState:(unint64_t)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v10, "activityType");
  if (a6 == 1 && v11 == 1)
  {
    objc_msgSend(v10, "viewModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shareUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[PXGadgetNavigationHelper navigateToGadgetForCMMInvitationWithIdentifier:](self->_navigationHelper, "navigateToGadgetForCMMInvitationWithIdentifier:", v13);
    }
    else
    {
      PLSharingGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v17 = 138412290;
        v18 = v10;
        _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "No share UUID after publishing action completed for session: %@", (uint8_t *)&v17, 0xCu);
      }

    }
  }
  objc_msgSend(v9, "navigationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v15, "px_popToViewControllerPrecedingViewController:animated:", v9, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowCoordinator, 0);
  objc_storeStrong((id *)&self->_navigationHelper, 0);
}

@end
