@implementation PXPeopleFlowNavigationController

- (PXPeopleFlowNavigationController)initWithFlowController:(id)a3
{
  id v5;
  void *v6;
  PXPeopleFlowNavigationController *v7;
  objc_super v9;
  objc_super v10;

  v5 = a3;
  if (objc_msgSend(v5, "hasNextViewController"))
  {
    objc_msgSend(v5, "nextViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10.receiver = self;
    v10.super_class = (Class)PXPeopleFlowNavigationController;
    v7 = -[PXPeopleFlowNavigationController initWithRootViewController:](&v10, sel_initWithRootViewController_, v6);

    if (!v7)
      goto LABEL_6;
    goto LABEL_5;
  }
  v9.receiver = self;
  v9.super_class = (Class)PXPeopleFlowNavigationController;
  v7 = -[PXPeopleFlowNavigationController init](&v9, sel_init);
  if (v7)
LABEL_5:
    objc_storeStrong((id *)&v7->_flowController, a3);
LABEL_6:

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PXPeopleFlowNavigationController;
  -[PXPeopleFlowNavigationController viewDidLoad](&v16, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel_);
  -[PXPeopleFlowNavigationController setCancelButton:](self, "setCancelButton:", v3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_done_);
  v19 = *MEMORY[0x1E0DC1138];
  v5 = v19;
  v6 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1350], "buttonFontSize");
  objc_msgSend(v6, "systemFontOfSize:weight:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleTextAttributes:forState:", v8, 0);

  -[PXPeopleFlowNavigationController setDoneButton:](self, "setDoneButton:", v4);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 101, self, sel_back_);
  -[PXPeopleFlowNavigationController setBackButton:](self, "setBackButton:", v9);
  v10 = objc_alloc(MEMORY[0x1E0DC34F0]);
  PXLocalizedStringFromTable(CFSTR("PXNext"), CFSTR("PhotosUICore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithTitle:style:target:action:", v11, 0, self, sel_next_);

  v17 = v5;
  v13 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1350], "buttonFontSize");
  objc_msgSend(v13, "systemFontOfSize:weight:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitleTextAttributes:forState:", v15, 0);

  -[PXPeopleFlowNavigationController setNextButton:](self, "setNextButton:", v12);
  -[PXPeopleFlowNavigationController setDelegate:](self, "setDelegate:", self);

}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 540.0;
  v3 = 700.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)cancel:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PXPeopleFlowNavigationController flowController](self, "flowController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel:", v4);

  -[PXPeopleFlowNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)done:(id)a3
{
  id v5;
  void *v6;
  char v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD aBlock[5];
  id v33;

  v5 = a3;
  -[PXPeopleFlowNavigationController currentViewController](self, "currentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "willTransitionToNextInFlow");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "shouldConfirmAdvancement");
  else
    v7 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__PXPeopleFlowNavigationController_done___block_invoke;
  aBlock[3] = &unk_1E51458F8;
  aBlock[4] = self;
  v8 = v5;
  v33 = v8;
  v9 = _Block_copy(aBlock);
  v10 = v9;
  if ((v7 & 1) == 0)
  {
    (*((void (**)(void *, _QWORD))v9 + 2))(v9, 0);
    goto LABEL_14;
  }
  v31 = v8;
  objc_msgSend(v6, "bootstrapContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v11;
  objc_msgSend(v11, "sourcePerson");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleFlowNavigationController.m"), 100, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("context.sourcePerson"), v25);
LABEL_17:

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "px_descriptionForAssertionMessage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleFlowNavigationController.m"), 100, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("context.sourcePerson"), v25, v27);

    goto LABEL_17;
  }
LABEL_9:
  v29 = v12;
  if (objc_msgSend(v12, "length"))
  {
    PXLocalizedStringForPersonOrPetAndVisibility(v13, 0, CFSTR("PXPeopleBootstrapVerifyAlertMessageNamed"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PXStringWithValidatedFormat();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    PXLocalizedStringForPersonOrPetAndVisibility(v13, 0, CFSTR("PXPeopleBootstrapVerifyAlertConfirmTitleNamed"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v12;
    PXStringWithValidatedFormat();
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PXLocalizedStringForPersonOrPetAndVisibility(v13, 0, CFSTR("PXPeopleBootstrapVerifyAlertMessageUnnamed"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringForPersonOrPetAndVisibility(v13, 0, CFSTR("PXPeopleBootstrapVerifyAlertConfirmTitleUnnamed"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v15, 0, v28);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v17, 0, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedStringFromTable(CFSTR("PXPeopleBootstrapVerifyAlertCancel"), CFSTR("PhotosUICore"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 1, &__block_literal_global_135613);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "addAction:", v19);
  objc_msgSend(v18, "addAction:", v22);
  -[PXPeopleFlowNavigationController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, 0);

  v8 = v31;
LABEL_14:

}

- (void)next:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[PXPeopleFlowNavigationController currentViewController](self, "currentViewController", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "willTransitionToNextInFlow");
  -[PXPeopleFlowNavigationController setAdvanceButtonEnabled:](self, "setAdvanceButtonEnabled:", 1);
  -[PXPeopleFlowNavigationController flowController](self, "flowController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasNextViewController"))
  {
    objc_msgSend(v4, "nextViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "willTransitionIn");
    -[PXPeopleFlowNavigationController pushViewController:animated:](self, "pushViewController:animated:", v5, 1);

  }
  else
  {
    -[PXPeopleFlowNavigationController done:](self, "done:", self);
  }

}

- (void)back:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[PXPeopleFlowNavigationController currentViewController](self, "currentViewController", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "willTransitionToPreviousInFlow");
  -[PXPeopleFlowNavigationController setAdvanceButtonEnabled:](self, "setAdvanceButtonEnabled:", 1);
  -[PXPeopleFlowNavigationController flowController](self, "flowController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasPreviousViewController"))
  {
    objc_msgSend(v4, "previousViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = (id)-[PXPeopleFlowNavigationController popViewControllerAnimated:](self, "popViewControllerAnimated:", 1);

  }
  else
  {
    -[PXPeopleFlowNavigationController cancel:](self, "cancel:", self);
  }

}

- (void)_updateActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PXPeopleFlowNavigationController flowController](self, "flowController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "hasPreviousViewController") & 1) != 0)
    -[PXPeopleFlowNavigationController backButton](self, "backButton");
  else
    -[PXPeopleFlowNavigationController cancelButton](self, "cancelButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "hasNextViewController") & 1) != 0)
    -[PXPeopleFlowNavigationController nextButton](self, "nextButton");
  else
    -[PXPeopleFlowNavigationController doneButton](self, "doneButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleFlowNavigationController currentViewController](self, "currentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setLeftBarButtonItem:", v3);
  objc_msgSend(v6, "setRightBarButtonItem:", v4);

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  int v6;
  void *v7;
  id v8;
  id v9;

  v9 = a4;
  v6 = objc_msgSend(v9, "conformsToProtocol:", &unk_1EE9F48C0);
  v7 = v9;
  if (v6)
  {
    v8 = v9;
    -[PXPeopleFlowNavigationController setCurrentViewController:](self, "setCurrentViewController:", v8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "setActionDelegate:", self);
    -[PXPeopleFlowNavigationController _updateActions](self, "_updateActions");

    v7 = v9;
  }

}

- (void)setAdvanceButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[PXPeopleFlowNavigationController nextButton](self, "nextButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

  -[PXPeopleFlowNavigationController doneButton](self, "doneButton");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

}

- (void)requestAdvanceToNextInFlow
{
  -[PXPeopleFlowNavigationController next:](self, "next:", self);
}

- (void)requestCancel
{
  -[PXPeopleFlowNavigationController cancel:](self, "cancel:", self);
}

- (void)requestDone
{
  -[PXPeopleFlowNavigationController done:](self, "done:", self);
}

- (PXPeopleFlowController)flowController
{
  return self->_flowController;
}

- (void)setFlowController:(id)a3
{
  objc_storeStrong((id *)&self->_flowController, a3);
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (UIBarButtonItem)backButton
{
  return self->_backButton;
}

- (void)setBackButton:(id)a3
{
  objc_storeStrong((id *)&self->_backButton, a3);
}

- (UIBarButtonItem)nextButton
{
  return self->_nextButton;
}

- (void)setNextButton:(id)a3
{
  objc_storeStrong((id *)&self->_nextButton, a3);
}

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (PXPeopleFlowViewController)currentViewController
{
  return self->_currentViewController;
}

- (void)setCurrentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_currentViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentViewController, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_flowController, 0);
}

uint64_t __41__PXPeopleFlowNavigationController_done___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "flowController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "done:", *(_QWORD *)(a1 + 40));

  result = objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  if (a2)
    return objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.people.bootstrap.speedbump.advance"), MEMORY[0x1E0C9AA70]);
  return result;
}

uint64_t __41__PXPeopleFlowNavigationController_done___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.people.bootstrap.speedbump.cancel"), MEMORY[0x1E0C9AA70]);
}

@end
