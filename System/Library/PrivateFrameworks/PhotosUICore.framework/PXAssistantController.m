@implementation PXAssistantController

- (PXAssistantController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssistantController+iOS.m"), 41, CFSTR("%s is not available as initializer"), "-[PXAssistantController init]");

  abort();
}

- (PXAssistantController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssistantController+iOS.m"), 45, CFSTR("%s is not available as initializer"), "-[PXAssistantController initWithCoder:]");

  abort();
}

- (PXAssistantController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssistantController+iOS.m"), 49, CFSTR("%s is not available as initializer"), "-[PXAssistantController initWithNibName:bundle:]");

  abort();
}

- (PXAssistantController)initWithContext:(id)a3
{
  id v6;
  PXAssistantController *v7;
  PXAssistantController *v8;
  uint64_t v9;
  NSMapTable *viewControllerToStepContext;
  void *v11;
  uint64_t v12;
  void *v14;
  objc_super v15;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssistantController+iOS.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  v15.receiver = self;
  v15.super_class = (Class)PXAssistantController;
  v7 = -[PXAssistantController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, 0, 0);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_context, a3);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    viewControllerToStepContext = v8->_viewControllerToStepContext;
    v8->_viewControllerToStepContext = (NSMapTable *)v9;

    v8->_useTransparentBarAppearance = 1;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if (v12 == 1)
      -[PXAssistantController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 2);
  }

  return v8;
}

- (void)loadView
{
  id v3;
  UINavigationController *v4;
  UINavigationController *navigationController;
  void *v6;
  uint64_t v7;
  void *v8;
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
  double v19;
  PXAssistantTraitCollection *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[PXAssistantController setView:](self, "setView:", v3);
  v4 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithNibName:bundle:", 0, 0);
  navigationController = self->_navigationController;
  self->_navigationController = v4;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 == 1)
    -[UINavigationController setModalPresentationStyle:](self->_navigationController, "setModalPresentationStyle:", 2);
  -[PXAssistantController _updateBarAppearance](self, "_updateBarAppearance");
  -[PXAssistantController addChildViewController:](self, "addChildViewController:", self->_navigationController);
  -[UINavigationController view](self->_navigationController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController view](self->_navigationController, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v9);

  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v22 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v8, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v25;
  objc_msgSend(v8, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v10;
  objc_msgSend(v8, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v13;
  v28 = v8;
  objc_msgSend(v8, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v15 = v3;
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v18);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v15, "px_screenScale");
    v20 = -[PXAssistantTraitCollection initWithDisplayScale:isRTL:]([PXAssistantTraitCollection alloc], "initWithDisplayScale:isRTL:", objc_msgSend(v15, "effectiveUserInterfaceLayoutDirection") == 1, v19);
    -[PXAssistantContext setAssistantTraitCollection:](self->_context, "setAssistantTraitCollection:", v20);

  }
  -[PXAssistantController _presentInitialViewControllers](self, "_presentInitialViewControllers");
  -[PXAssistantController presentationController](self, "presentationController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDelegate:", self);

}

- (CGSize)preferredContentSize
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  objc_super v7;
  CGSize result;

  if (self->_navigationController
    && (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "userInterfaceIdiom"),
        v3,
        v4 == 1))
  {
    -[UINavigationController preferredContentSize](self->_navigationController, "preferredContentSize");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PXAssistantController;
    -[PXAssistantController preferredContentSize](&v7, sel_preferredContentSize);
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)_updateNextStepContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "viewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](self->_viewControllerToStepContext, "setObject:forKey:", v4, v5);
  -[PXAssistantController _setStepContext:](self, "_setStepContext:", v4);

  -[PXAssistantController _updateViewController:forChangesWithDescriptor:](self, "_updateViewController:forChangesWithDescriptor:", v5, 13);
}

- (id)_nextViewControllerFromViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[NSMapTable objectForKey:](self->_viewControllerToStepContext, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssistantController nextStepContextForStepContextIdentifier:](self, "nextStepContextForStepContextIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssistantController _updateNextStepContext:](self, "_updateNextStepContext:", v6);
  objc_msgSend(v6, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_presentInitialViewControllers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  UINavigationController *navigationController;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PXAssistantController initialStepContexts](self, "initialStepContexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[PXAssistantController _updateNextStepContext:](self, "_updateNextStepContext:", v8);
        objc_msgSend(v8, "viewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        navigationController = self->_navigationController;
        objc_msgSend(v8, "viewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UINavigationController pushViewController:animated:](navigationController, "pushViewController:animated:", v11, 0);

        if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE9DF990))
          objc_msgSend(v9, "setAssistantViewControllerDelegate:", self);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)_setStepContext:(id)a3
{
  PXAssistantStepContext **p_stepContext;
  PXAssistantStepContext *v7;
  PXAssistantStepContext *v8;
  char v9;
  void *v10;
  PXAssistantStepContext *v11;

  v11 = (PXAssistantStepContext *)a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssistantController+iOS.m"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stepContext"));

  }
  p_stepContext = &self->_stepContext;
  v7 = self->_stepContext;
  if (v7 == v11)
  {

  }
  else
  {
    v8 = v11;
    v9 = -[PXAssistantStepContext isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
      -[PXAssistantStepContext unregisterChangeObserver:context:](*p_stepContext, "unregisterChangeObserver:context:", self, PXAssistantStepContextObservationContext);
      objc_storeStrong((id *)&self->_stepContext, a3);
      -[PXAssistantStepContext registerChangeObserver:context:](*p_stepContext, "registerChangeObserver:context:", self, PXAssistantStepContextObservationContext);
      -[PXAssistantController _setUseTransparentBarAppearance:](self, "_setUseTransparentBarAppearance:", -[PXAssistantStepContext useTransparentBarAppearance](v8, "useTransparentBarAppearance"));
    }
  }

}

- (void)_updateViewController:(id)a3 forChangesWithDescriptor:(unint64_t)a4
{
  __int16 v4;
  void *v6;
  void *v7;
  char **v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v4 = a4;
  v19 = a3;
  if ((v4 & 5) != 0)
  {
    v6 = 0;
    switch(-[PXAssistantStepContext firstButtonType](self->_stepContext, "firstButtonType"))
    {
      case 0:
        PXLocalizedStringFromTable(CFSTR("PXAssistant_ButtonTitle_Next"), CFSTR("PhotosUICore"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = &selRef__stepForwardBarButtonItemAction_;
        goto LABEL_8;
      case 1:
        PXLocalizedStringFromTable(CFSTR("PXAssistant_ButtonTitle_Done"), CFSTR("PhotosUICore"));
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      case 2:
        -[PXAssistantStepContext firstButtonTitle](self->_stepContext, "firstButtonTitle");
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:
        v7 = (void *)v9;
        v8 = &selRef__completeBarButtonItemAction_;
        goto LABEL_8;
      case 4:
        PXLocalizedStringFromTable(CFSTR("PXAssistant_ButtonTitle_Cancel"), CFSTR("PhotosUICore"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = &selRef__cancelBarButtonItemDestructiveAction_;
LABEL_8:
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v7, 0, self, *v8);

        break;
      default:
        break;
    }
    objc_msgSend(v19, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRightBarButtonItem:", v6);

  }
  if ((v4 & 4) == 0)
  {
    if ((v4 & 0x200) == 0)
      goto LABEL_12;
LABEL_15:
    -[PXAssistantController _setUseTransparentBarAppearance:](self, "_setUseTransparentBarAppearance:", -[PXAssistantStepContext useTransparentBarAppearance](self->_stepContext, "useTransparentBarAppearance"));
    if ((v4 & 8) == 0)
      goto LABEL_21;
    goto LABEL_16;
  }
  v11 = -[PXAssistantStepContext firstButtonEnabled](self->_stepContext, "firstButtonEnabled");
  objc_msgSend(v19, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rightBarButtonItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setEnabled:", v11);
  if ((v4 & 0x200) != 0)
    goto LABEL_15;
LABEL_12:
  if ((v4 & 8) == 0)
    goto LABEL_21;
LABEL_16:
  objc_msgSend(v19, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXAssistantStepContext secondButtonType](self->_stepContext, "secondButtonType") == 2)
  {
    objc_msgSend(v14, "setLeftBarButtonItem:", 0);
    objc_msgSend(v14, "setHidesBackButton:", 1);
  }
  else
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", &stru_1E5149688, 0, 0, 0);
    objc_msgSend(v14, "setBackBarButtonItem:", v15);

    -[UINavigationController viewControllers](self->_navigationController, "viewControllers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (!v17)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelBarButtonItemAction_);
      objc_msgSend(v14, "setLeftBarButtonItem:", v18);

    }
  }
  objc_msgSend(v14, "setBackButtonTitle:", &stru_1E5149688);

LABEL_21:
}

- (void)_stepForwardInAssistantAnimated:(BOOL)a3 currentViewController:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  v6 = a4;
  if (!v6)
  {
    -[UINavigationController viewControllers](self->_navigationController, "viewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v9;
  }
  v10 = v6;
  -[PXAssistantController _nextViewControllerFromViewController:](self, "_nextViewControllerFromViewController:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController pushViewController:animated:](self->_navigationController, "pushViewController:animated:", v8, v4);
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE9DF990))
    objc_msgSend(v8, "setAssistantViewControllerDelegate:", self);

}

- (void)_setUseTransparentBarAppearance:(BOOL)a3
{
  if (self->_useTransparentBarAppearance != a3)
  {
    self->_useTransparentBarAppearance = a3;
    -[PXAssistantController _updateBarAppearance](self, "_updateBarAppearance");
  }
}

- (void)_confirmCancellationOfAssistantWithDestruction
{
  id v3;
  _QWORD v4[5];

  -[PXAssistantStepContext identifier](self->_stepContext, "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PXAssistantController shouldConfirmCancellationOfAssistantForStepContextWithIdentifier:](self, "shouldConfirmCancellationOfAssistantForStepContextWithIdentifier:"))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __71__PXAssistantController__confirmCancellationOfAssistantWithDestruction__block_invoke;
    v4[3] = &unk_1E5118340;
    v4[4] = self;
    -[PXAssistantController stepContextWithIdentifier:confirmCancellationWithAlertProperties:](self, "stepContextWithIdentifier:confirmCancellationWithAlertProperties:", v3, v4);
  }
  else
  {
    -[PXAssistantController cancelAssistantWithDestruction:](self, "cancelAssistantWithDestruction:", 0);
  }

}

- (void)_stepForwardBarButtonItemAction:(id)a3
{
  -[PXAssistantController _stepForwardInAssistantAnimated:currentViewController:](self, "_stepForwardInAssistantAnimated:currentViewController:", 1, 0);
}

- (void)_cancelBarButtonItemAction:(id)a3
{
  -[PXAssistantController cancelAssistantWithDestruction:](self, "cancelAssistantWithDestruction:", 0);
}

- (void)_completeBarButtonItemAction:(id)a3
{
  -[PXAssistantController completeAssistantWithError:](self, "completeAssistantWithError:", 0);
}

- (void)_updateBarAppearance
{
  void *v3;
  void *v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  objc_msgSend(v5, "shadowColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configureWithTransparentBackground");
  if (!-[PXAssistantStepContext useTransparentBarAppearance](self->_stepContext, "useTransparentBarAppearance"))
    objc_msgSend(v5, "setShadowColor:", v3);
  -[UINavigationController navigationBar](self->_navigationController, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStandardAppearance:", v5);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v7;
  id v8;

  if ((void *)PXAssistantStepContextObservationContext == a5)
  {
    -[UINavigationController viewControllers](self->_navigationController, "viewControllers", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[PXAssistantController _updateViewController:forChangesWithDescriptor:](self, "_updateViewController:forChangesWithDescriptor:", v8, a4);
  }
}

- (void)stepForwardInAssistantForAssistantViewController:(id)a3
{
  -[PXAssistantController _stepForwardInAssistantAnimated:currentViewController:](self, "_stepForwardInAssistantAnimated:currentViewController:", 1, 0);
}

- (void)stepForwardInAssistantForAssistantViewControllerAsCurrentViewController:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v5;
  else
    v4 = 0;

  -[PXAssistantController _stepForwardInAssistantAnimated:currentViewController:](self, "_stepForwardInAssistantAnimated:currentViewController:", 1, v4);
}

- (void)cancelAssistantForAssistantViewController:(id)a3
{
  -[PXAssistantController cancelAssistantWithDestruction:](self, "cancelAssistantWithDestruction:", 0);
}

- (void)completeAssistantForAssistantViewController:(id)a3
{
  -[PXAssistantController completeAssistantWithError:](self, "completeAssistantWithError:", 0);
}

- (void)assistantForAssistantViewController:(id)a3 failedWithError:(id)a4
{
  -[PXAssistantController completeAssistantWithError:](self, "completeAssistantWithError:", a4);
}

- (void)assistantViewController:(id)a3 pushViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;

  v5 = a5;
  v8 = a4;
  v10 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssistantController+iOS.m"), 353, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewController"));

    v8 = 0;
  }
  -[UINavigationController pushViewController:animated:](self->_navigationController, "pushViewController:animated:", v8, v5);

}

- (void)assistantViewController:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;

  v5 = a5;
  v8 = a4;
  v10 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssistantController+iOS.m"), 359, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewController"));

    v8 = 0;
  }
  -[UINavigationController presentViewController:animated:completion:](self->_navigationController, "presentViewController:animated:completion:", v8, v5, 0);

}

- (void)assistantViewController:(id)a3 dismissViewControllerAnimated:(BOOL)a4
{
  -[UINavigationController dismissViewControllerAnimated:completion:](self->_navigationController, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)assistantViewController:(id)a3 presentAlertWithConfiguration:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  UINavigationController *navigationController;
  void *v9;
  PXAlert *v10;

  v5 = a5;
  v7 = a4;
  v10 = -[PXAlert initWithConfiguration:]([PXAlert alloc], "initWithConfiguration:", v7);

  navigationController = self->_navigationController;
  -[PXAlert alertController](v10, "alertController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController presentViewController:animated:completion:](navigationController, "presentViewController:animated:completion:", v9, v5, 0);

}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  PXAssistantContext *context;
  void *v5;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 1;
  context = self->_context;
  -[PXAssistantStepContext identifier](self->_stepContext, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(context) = -[PXAssistantContext shouldConfirmCancellationOfAssistantForStepContextWithIdentifier:](context, "shouldConfirmCancellationOfAssistantForStepContextWithIdentifier:", v5);

  return context ^ 1;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[PXAssistantController cancelAssistantWithDestruction:](self, "cancelAssistantWithDestruction:", 0);
}

- (PXAssistantContext)context
{
  return self->_context;
}

- (PXAssistantControllerDelegate)delegate
{
  return (PXAssistantControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_stepContext, 0);
  objc_storeStrong((id *)&self->_viewControllerToStepContext, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

void __71__PXAssistantController__confirmCancellationOfAssistantWithDestruction__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[6];
  _QWORD v26[5];
  _QWORD v27[5];
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = a2;
  PLUIGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v29 = v19;
    _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEFAULT, "Will confirm request to cancel assistant controller: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v17, v16, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __71__PXAssistantController__confirmCancellationOfAssistantWithDestruction__block_invoke_209;
  v27[3] = &unk_1E5144530;
  v27[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v15, 2, v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "addAction:", v22);
  v26[0] = v21;
  v26[1] = 3221225472;
  v26[2] = __71__PXAssistantController__confirmCancellationOfAssistantWithDestruction__block_invoke_211;
  v26[3] = &unk_1E5144530;
  v26[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v14, 1, v26);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "addAction:", v23);
  if (v13)
  {
    v25[0] = v21;
    v25[1] = 3221225472;
    v25[2] = __71__PXAssistantController__confirmCancellationOfAssistantWithDestruction__block_invoke_212;
    v25[3] = &unk_1E5122D98;
    v25[4] = *(_QWORD *)(a1 + 32);
    v25[5] = a7;
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v13, 0, v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAction:", v24);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "presentViewController:animated:completion:", v20, 1, 0);

}

uint64_t __71__PXAssistantController__confirmCancellationOfAssistantWithDestruction__block_invoke_209(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "Did confirm request to cancel assistant controller: %@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "cancelAssistantWithDestruction:", 1);
}

void __71__PXAssistantController__confirmCancellationOfAssistantWithDestruction__block_invoke_211(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PLUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "User canceled confirmation of request to cancel assistant controller: %@", (uint8_t *)&v4, 0xCu);
  }

}

uint64_t __71__PXAssistantController__confirmCancellationOfAssistantWithDestruction__block_invoke_212(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "User chose to continue when requested to cancel assistant controller: %@", (uint8_t *)&v6, 0xCu);
  }

  v4 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
    return objc_msgSend(v4, "cancelAssistantWithDestruction:", 0);
  else
    return objc_msgSend(v4, "_stepForwardInAssistantAnimated:currentViewController:", 1, 0);
}

- (void)_completeAssistantWithError:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  PXAssistantController *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[PXAssistantController completed](self, "completed"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssistantController_Internal.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!self.completed"));

  }
  -[PXAssistantController setCompleted:](self, "setCompleted:", 1);
  -[PXAssistantController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "assistantController:completedWithError:", self, v5);
  }
  else
  {
    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v11 = self;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "No PXAssistantControllerDelegate available to handle assistantController: %@ completedWithError: %@", buf, 0x16u);
    }

  }
}

- (void)cancelAssistantWithDestruction:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  int v12;
  PXAssistantController *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (-[PXAssistantController completed](self, "completed"))
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = self;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Ignoring attempt to cancel already completed assistant controller: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    -[PXAssistantController context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[PXAssistantController context](self, "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "willCancelAssistant");

    }
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v10)
      {
        v12 = 138412290;
        v13 = self;
        _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "Assistant cancelled with destruction by the user: %@", (uint8_t *)&v12, 0xCu);
      }
      v11 = -1002;
    }
    else
    {
      if (v10)
      {
        v12 = 138412290;
        v13 = self;
        _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "Assistant cancelled by the user: %@", (uint8_t *)&v12, 0xCu);
      }
      v11 = -1001;
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXAssistantErrorDomain"), v11, CFSTR("Assistant was cancelled by the user"));
    v5 = objc_claimAutoreleasedReturnValue();
    -[PXAssistantController _completeAssistantWithError:](self, "_completeAssistantWithError:", v5);
  }

}

- (void)completeAssistantWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  PXAssistantController *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PXAssistantController completed](self, "completed"))
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = self;
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Ignoring attempt to complete already completed assistant controller: %@, error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v4)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v8 = 138412546;
        v9 = self;
        v10 = 2112;
        v11 = v4;
        _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Assistant controller: %@, failed with error: %@", (uint8_t *)&v8, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("PXAssistantErrorDomain"), -1000, v4, CFSTR("Assistant failed with an error"));
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138412290;
        v9 = self;
        _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "Assistant completed successfully: %@", (uint8_t *)&v8, 0xCu);
      }

      v5 = 0;
    }
    -[PXAssistantController _completeAssistantWithError:](self, "_completeAssistantWithError:", v5);
  }

}

- (id)initialStepContexts
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PXAssistantController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "initialStepContextIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v2, "stepContextForStepContextIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)nextStepContextForStepContextIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PXAssistantController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextStepContextIdentifierFromStepContextIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stepContextForStepContextIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)shouldConfirmCancellationOfAssistantForStepContextWithIdentifier:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssistantController_Internal.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  -[PXAssistantController context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "shouldConfirmCancellationOfAssistantForStepContextWithIdentifier:", v5);
  else
    v7 = 0;

  return v7;
}

- (void)stepContextWithIdentifier:(id)a3 confirmCancellationWithAlertProperties:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssistantController_Internal.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssistantController_Internal.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("alertProperties"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  -[PXAssistantController context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stepContextWithIdentifier:confirmCancellationWithAlertProperties:", v11, v7);

}

@end
