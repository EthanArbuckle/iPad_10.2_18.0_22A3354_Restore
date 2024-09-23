@implementation WFComposeFlowController

- (WFComposeFlowController)initWithPresenter:(id)a3 navigationController:(id)a4 database:(id)a5 workflow:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  WFComposeFlowController *v14;
  WFComposeFlowController *v15;
  WFComposeFlowController *v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)WFComposeFlowController;
  v14 = -[WFComposeFlowController init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_presenter, v10);
    objc_storeWeak((id *)&v15->_navigationController, v11);
    objc_storeStrong((id *)&v15->_database, a5);
    objc_storeWeak((id *)&v15->_workflow, v13);
    v16 = v15;
  }

  return v15;
}

- (BOOL)workflowHasContent
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[WFComposeFlowController workflow](self, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 1;
  }
  else
  {
    -[WFComposeFlowController workflow](self, "workflow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "workflowTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "containsObject:", *MEMORY[0x24BEC1D40]);

  }
  return v5;
}

- (void)startCancelFlowWithButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];

  v4 = a3;
  if (-[WFComposeFlowController workflowHasContent](self, "workflowHasContent"))
  {
    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "popoverPresentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBarButtonItem:", v4);

    v7 = (void *)MEMORY[0x24BEBD3A8];
    WFLocalizedString(CFSTR("Delete Shortcut"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __53__WFComposeFlowController_startCancelFlowWithButton___block_invoke;
    v19[3] = &unk_24E6044D0;
    v19[4] = self;
    objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 2, v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v10);

    v11 = (void *)MEMORY[0x24BEBD3A8];
    WFLocalizedString(CFSTR("Save Shortcut"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __53__WFComposeFlowController_startCancelFlowWithButton___block_invoke_2;
    v18[3] = &unk_24E6044D0;
    v18[4] = self;
    objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v13);

    v14 = (void *)MEMORY[0x24BEBD3A8];
    WFLocalizedString(CFSTR("Cancel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 1, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v16);

    -[WFComposeFlowController presenter](self, "presenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "presentViewController:animated:completion:", v5, 1, 0);

  }
  else
  {
    -[WFComposeFlowController finishEditing:](self, "finishEditing:", 1);
  }

}

- (void)startSaveFlow
{
  WFWorkflowWizardNameViewController *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  WFWizardNamePresentationManager *v8;
  void *v9;
  WFWizardNamePresentationManager *v10;
  void *v11;
  WFWorkflowWizardNameViewController *v12;

  v3 = [WFWorkflowWizardNameViewController alloc];
  -[WFComposeFlowController workflow](self, "workflow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[WFWorkflowWizardNameConfiguration newWorkflowConfiguration](WFWorkflowWizardNameConfiguration, "newWorkflowConfiguration");
  v12 = -[WFWorkflowWizardNameViewController initWithWorkflow:configuration:](v3, "initWithWorkflow:configuration:", v4, v5);

  -[WFWorkflowWizardNameViewController setDelegate:](v12, "setDelegate:", self);
  -[WFComposeFlowController workflow](self, "workflow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "record");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSource:", CFSTR("ShortcutSourceOnDevice"));

  v8 = [WFWizardNamePresentationManager alloc];
  -[WFComposeFlowController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WFWizardNamePresentationManager initWithNavigationController:wizardNameViewController:](v8, "initWithNavigationController:wizardNameViewController:", v9, v12);
  -[WFComposeFlowController setPresentationManager:](self, "setPresentationManager:", v10);

  -[WFComposeFlowController presentationManager](self, "presentationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "present");

}

- (void)finishEditing:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;

  if (!a3)
  {
    v18 = objc_alloc_init(MEMORY[0x24BEC3A88]);
    -[WFComposeFlowController workflow](self, "workflow");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "actions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActionCount:", objc_msgSend(v20, "count"));

    objc_msgSend(v18, "setShortcutSource:", CFSTR("ShortcutSourceOnDevice"));
    objc_msgSend(v18, "track");

LABEL_6:
    -[WFComposeFlowController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "composeFlowControllerDidFinishEditing:", self);
    goto LABEL_7;
  }
  -[WFComposeFlowController database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFComposeFlowController workflow](self, "workflow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v4, "deleteReference:error:", v6, &v22);
  v7 = v22;

  v8 = objc_alloc_init(MEMORY[0x24BEC3C68]);
  -[WFComposeFlowController workflow](self, "workflow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "associatedAppBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAddToSiriBundleIdentifier:", v10);

  -[WFComposeFlowController workflow](self, "workflow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "galleryIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGalleryIdentifier:", v12);

  -[WFComposeFlowController workflow](self, "workflow");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "source");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShortcutSource:", v14);

  objc_msgSend(v8, "track");
  if (!v7)
  {

    goto LABEL_6;
  }
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __41__WFComposeFlowController_finishEditing___block_invoke;
  v21[3] = &unk_24E604D88;
  v21[4] = self;
  objc_msgSend(MEMORY[0x24BE19370], "alertWithError:confirmationHandler:", v7, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFComposeFlowController presenter](self, "presenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  WFUserInterfaceFromViewController();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "presentAlert:", v15);

LABEL_7:
}

- (void)workflowWizardNameViewController:(id)a3 didFinishWithName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v5 = a4;
  -[WFComposeFlowController database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFComposeFlowController workflow](self, "workflow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v9 = (id)objc_msgSend(v6, "renameReference:to:error:", v8, v5, &v23);
  v10 = v23;

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BE19370], "alertWithError:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFComposeFlowController presentationManager](self, "presentationManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "wizardNameViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    WFUserInterfaceFromViewController();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "presentAlert:", v11);

  }
  else
  {
    -[WFComposeFlowController workflow](self, "workflow");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "record");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addWatchWorkflowTypeIfEligible");

    -[WFComposeFlowController database](self, "database");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFComposeFlowController workflow](self, "workflow");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "record");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFComposeFlowController workflow](self, "workflow");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "reference");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "saveRecord:withDescriptor:error:", v19, v21, 0);

    -[WFComposeFlowController presentationManager](self, "presentationManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dismiss");

    -[WFComposeFlowController finishEditing:](self, "finishEditing:", 0);
  }

}

- (WFComposeFlowControllerDelegate)delegate
{
  return (WFComposeFlowControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)presenter
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (UINavigationController)navigationController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_navigationController);
}

- (WFDatabase)database
{
  return self->_database;
}

- (WFWorkflow)workflow
{
  return (WFWorkflow *)objc_loadWeakRetained((id *)&self->_workflow);
}

- (WFWizardNamePresentationManager)presentationManager
{
  return self->_presentationManager;
}

- (void)setPresentationManager:(id)a3
{
  objc_storeStrong((id *)&self->_presentationManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationManager, 0);
  objc_destroyWeak((id *)&self->_workflow);
  objc_storeStrong((id *)&self->_database, 0);
  objc_destroyWeak((id *)&self->_navigationController);
  objc_destroyWeak((id *)&self->_presenter);
  objc_destroyWeak((id *)&self->_delegate);
}

void __41__WFComposeFlowController_finishEditing___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "composeFlowControllerDidFinishEditing:", *(_QWORD *)(a1 + 32));

}

uint64_t __53__WFComposeFlowController_startCancelFlowWithButton___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishEditing:", 1);
}

uint64_t __53__WFComposeFlowController_startCancelFlowWithButton___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startSaveFlow");
}

@end
