@implementation PUPickerPrincipalUIViewController

- (void)updateViewConstraints
{
  void *v3;
  uint64_t v4;
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  -[PUPickerPrincipalUIViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_presentationSemanticContext");
  v5 = v4 == 3;
  v6 = v4 != 3;

  -[PUPickerPrincipalUIViewController topConstraint](self, "topConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  -[PUPickerPrincipalUIViewController bottomConstraint](self, "bottomConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  -[PUPickerPrincipalUIViewController leadingConstraint](self, "leadingConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", v6);

  -[PUPickerPrincipalUIViewController trailingConstraint](self, "trailingConstraint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", v6);

  -[PUPickerPrincipalUIViewController leadingSafeAreaConstraint](self, "leadingSafeAreaConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", v5);

  -[PUPickerPrincipalUIViewController trailingSafeAreaConstraint](self, "trailingSafeAreaConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", v5);

  v13.receiver = self;
  v13.super_class = (Class)PUPickerPrincipalUIViewController;
  -[PUPickerPrincipalUIViewController updateViewConstraints](&v13, sel_updateViewConstraints);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUPickerPrincipalUIViewController;
  v4 = a3;
  -[PUPickerPrincipalUIViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[PUPickerPrincipalUIViewController traitCollection](self, "traitCollection", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_presentationSemanticContext");
  v7 = objc_msgSend(v4, "_presentationSemanticContext");

  if (v6 != v7)
  {
    -[PUPickerPrincipalUIViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsUpdateConstraints");

    -[PUPickerPrincipalUIViewController updateModalInPresentation](self, "updateModalInPresentation");
  }
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUPickerPrincipalUIViewController;
  v4 = a3;
  -[PUPickerPrincipalUIViewController preferredContentSizeDidChangeForChildContentContainer:](&v9, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  v6 = v5;
  v8 = v7;

  -[PUPickerPrincipalUIViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (BOOL)updatePicker
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  PUPickerCoordinator *v10;
  void *v11;
  PUPickerCoordinator *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[4];
  id v59;
  id location;
  id v61;

  -[PUPickerPrincipalUIViewController manager](self, "manager");
  v3 = objc_claimAutoreleasedReturnValue();
  -[PUPickerPrincipalUIViewController domain](self, "domain");
  v4 = objc_claimAutoreleasedReturnValue();
  -[PUPickerPrincipalUIViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v56 = (void *)v4;
  v57 = (void *)v3;
  v55 = v5;
  if (v3 && v4 && v5)
  {
    objc_msgSend(v5, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0;
    v8 = objc_msgSend(v7, "openAndWaitWithUpgrade:error:", 0, &v61);
    v9 = v61;

    if (v8)
    {
      v10 = [PUPickerCoordinator alloc];
      -[PUPickerPrincipalUIViewController loadingStatusManager](self, "loadingStatusManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[PUPickerCoordinator initWithPUConfiguration:coordinatorActionHandler:loadingStatusManager:](v10, "initWithPUConfiguration:coordinatorActionHandler:loadingStatusManager:", v6, self, v11);

      -[PUPickerCoordinator viewController](v12, "viewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v9, "code") == 3108 || objc_msgSend(v9, "code") == 5403)
        v17 = 3;
      else
        v17 = 4;
      objc_msgSend(v6, "phPickerConfiguration");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD21E0], "unavailableViewController:configuration:error:delegate:", v17, v23, v9, self);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = 0;
    }

  }
  else
  {
    objc_msgSend(v5, "phPickerConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      v16 = v14;
    else
      v16 = objc_alloc_init(MEMORY[0x1E0CD2168]);
    v18 = v16;

    -[PUPickerPrincipalUIViewController domainError](self, "domainError");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v21 = v19;
    }
    else
    {
      -[PUPickerPrincipalUIViewController configurationError](self, "configurationError");
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    v22 = v21;

    objc_msgSend(MEMORY[0x1E0CD21E0], "unavailableViewController:configuration:error:delegate:", 0, v18, v22, self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = 0;
  }
  -[PUPickerPrincipalUIViewController setCoordinator:](self, "setCoordinator:", v12);
  objc_msgSend(v13, "preferredContentSize");
  -[PUPickerPrincipalUIViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  -[PUPickerPrincipalUIViewController px_addOrReplaceChildViewController:activateConstraints:](self, "px_addOrReplaceChildViewController:activateConstraints:", v13, 0);
  -[PUPickerPrincipalUIViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v13;
  objc_msgSend(v13, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerPrincipalUIViewController setTopConstraint:](self, "setTopConstraint:", v28);

  objc_msgSend(v24, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerPrincipalUIViewController setBottomConstraint:](self, "setBottomConstraint:", v31);

  objc_msgSend(v24, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerPrincipalUIViewController setLeadingConstraint:](self, "setLeadingConstraint:", v34);

  objc_msgSend(v24, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerPrincipalUIViewController setTrailingConstraint:](self, "setTrailingConstraint:", v37);

  objc_msgSend(v24, "safeAreaLayoutGuide");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerPrincipalUIViewController setLeadingSafeAreaConstraint:](self, "setLeadingSafeAreaConstraint:", v41);

  objc_msgSend(v24, "safeAreaLayoutGuide");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "trailingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerPrincipalUIViewController setTrailingSafeAreaConstraint:](self, "setTrailingSafeAreaConstraint:", v45);

  objc_msgSend(v24, "setNeedsUpdateConstraints");
  objc_msgSend(v24, "window");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setCanResizeToFitContent:", 1);

  objc_msgSend(v24, "layoutIfNeeded");
  -[PUPickerPrincipalUIViewController updateModalInPresentation](self, "updateModalInPresentation");
  objc_initWeak(&location, self);
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __49__PUPickerPrincipalUIViewController_updatePicker__block_invoke;
  v58[3] = &unk_1E58AB2F8;
  objc_copyWeak(&v59, &location);
  -[PUPickerCoordinator setSelectionDidChangeObserver:](v12, "setSelectionDidChangeObserver:", v58);
  v47 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[PUPickerPrincipalUIViewController configuration](self, "configuration");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "preselectedItemIdentifiers");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "set");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50;
  if (!v50)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v52 = (void *)objc_msgSend(v47, "initWithSet:", v51);
  -[PUPickerPrincipalUIViewController setProgrammaticallySelectedItemIdentifiers:](self, "setProgrammaticallySelectedItemIdentifiers:", v52);

  if (!v50)
  objc_destroyWeak(&v59);
  objc_destroyWeak(&location);

  return v12 != 0;
}

- (void)updateModalInPresentation
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[PUPickerPrincipalUIViewController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "phPickerConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_disabledPrivateCapabilities");

  if ((v5 & 0x40) == 0)
  {
    -[PUPickerPrincipalUIViewController traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_presentationSemanticContext");

    v8 = -[PUPickerPrincipalUIViewController isModalInPresentation](self, "isModalInPresentation");
    if (v7 == 3)
    {
      if ((v8 & 1) == 0)
        return;
      v9 = 0;
    }
    else if (v8)
    {
      if ((-[PUPickerPrincipalUIViewController isModalInPresentation](self, "isModalInPresentation") & 1) != 0)
        return;
      v9 = 1;
    }
    else
    {
      -[PUPickerPrincipalUIViewController coordinator](self, "coordinator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "selectionDidChange");

      if ((_DWORD)v9 == -[PUPickerPrincipalUIViewController isModalInPresentation](self, "isModalInPresentation"))return;
    }
    -[PUPickerPrincipalUIViewController setModalInPresentation:](self, "setModalInPresentation:", v9);
    -[PUPickerPrincipalUIViewController extensionContext](self, "extensionContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_auxiliaryConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "remoteObjectProxy");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "_pickerDidSetModalInPresentation:", v9);
  }
}

- (void)logExitIfNeeded:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 245, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchResult != nil"));

  }
  if (MEMORY[0x1AF42B6B0]() && objc_msgSend(v16, "count"))
  {
    objc_msgSend(v16, "fetchedObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PXMap();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0CD1390];
    -[PUPickerPrincipalUIViewController coordinator](self, "coordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "countOfAssetsWithLocationFromUUIDs:photoLibrary:", v6, v10);

    if (v11 >= 1)
    {
      -[PUPickerPrincipalUIViewController extensionContext](self, "extensionContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_auxiliaryConnection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      PLClientApplicationIdentifierFromXPCConnection();
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      plslogGreenTea();
    }

  }
}

- (void)confirmConfidentialWarning:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  void (**v20)(id, uint64_t);
  _QWORD v21[4];
  void (**v22)(id, uint64_t);

  v7 = a3;
  v8 = (void (**)(id, uint64_t))a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (v7)
      goto LABEL_3;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 273, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchResult != nil"));

    if (v8)
      goto LABEL_4;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 272, CFSTR("%s must be called on the main thread"), "-[PUPickerPrincipalUIViewController confirmConfidentialWarning:completionHandler:]");

  if (!v7)
    goto LABEL_14;
LABEL_3:
  if (v8)
    goto LABEL_4;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 274, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler != nil"));

LABEL_4:
  objc_msgSend(v7, "fetchType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 != (void *)*MEMORY[0x1E0CD1B90])
  {
LABEL_10:

    goto LABEL_11;
  }
  -[PUPickerPrincipalUIViewController configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "allowsConfidentialWarning")
    || (objc_msgSend(MEMORY[0x1E0D7B978], "confidentialityCheckRequired") & 1) == 0)
  {

    goto LABEL_10;
  }
  v11 = (void *)MEMORY[0x1E0D7B978];
  objc_msgSend(v7, "fetchedObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v11, "confidentialWarningRequiredForAssets:", v12);

  if (!(_DWORD)v11)
  {
LABEL_11:
    v8[2](v8, 1);
    goto LABEL_12;
  }
  v13 = (void *)MEMORY[0x1E0D7B978];
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __82__PUPickerPrincipalUIViewController_confirmConfidentialWarning_completionHandler___block_invoke;
  v21[3] = &unk_1E58AB6C0;
  v22 = v8;
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __82__PUPickerPrincipalUIViewController_confirmConfidentialWarning_completionHandler___block_invoke_2;
  v19[3] = &unk_1E58AB6C0;
  v20 = v22;
  objc_msgSend(v13, "confidentialityAlertWithConfirmAction:abortAction:", v21, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerPrincipalUIViewController px_presentOverTopmostPresentedViewController:animated:completion:](self, "px_presentOverTopmostPresentedViewController:animated:completion:", v15, 1, 0);

LABEL_12:
}

- (void)confirmUserSafetyIntervention:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t);
  void *v9;
  uint64_t v10;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  void (**v26)(id, uint64_t);

  v7 = a3;
  v8 = (void (**)(id, uint64_t))a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (v7)
      goto LABEL_3;
LABEL_20:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 293, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchResult != nil"));

    if (v8)
      goto LABEL_4;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 292, CFSTR("%s must be called on the main thread"), "-[PUPickerPrincipalUIViewController confirmUserSafetyIntervention:completionHandler:]");

  if (!v7)
    goto LABEL_20;
LABEL_3:
  if (v8)
    goto LABEL_4;
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 294, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler != nil"));

LABEL_4:
  -[PUPickerPrincipalUIViewController configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "confirmationBehavior");

  v12 = v10 == 2 || v10 == 4;
  objc_msgSend(v7, "fetchType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 != (void *)*MEMORY[0x1E0CD1B90])
  {

LABEL_17:
    v8[2](v8, 1);
    goto LABEL_18;
  }
  -[PUPickerPrincipalUIViewController configuration](self, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "shouldShowCommunicationSafetyIntervention");

  if (!v16)
    goto LABEL_17;
  -[PUPickerPrincipalUIViewController coordinator](self, "coordinator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v12)
    v19 = v7;
  else
    v19 = 0;
  objc_msgSend(v17, "startActivityIndicatorsForAssetsWithFetchResult:", v19);

  v20 = (void *)MEMORY[0x1E0D7B988];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __85__PUPickerPrincipalUIViewController_confirmUserSafetyIntervention_completionHandler___block_invoke;
  v24[3] = &unk_1E58A6BF8;
  v24[4] = self;
  v25 = v7;
  v26 = v8;
  objc_msgSend(v20, "userSafetyInterventionCheckRequiredBeforeSharingAssets:completion:", v25, v24);

LABEL_18:
}

- (id)showProgress:(id)a3 forAsset:(id)a4 progressURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PUPickerPrincipalUIViewController loadingStatusManager](self, "loadingStatusManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "willBeginLoadOperationWithItemIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB3800], "keyPathWithRootObject:path:", v8, "fractionCompleted");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __71__PUPickerPrincipalUIViewController_showProgress_forAsset_progressURL___block_invoke;
  v31[3] = &unk_1E589AC68;
  objc_copyWeak(&v33, &location);
  v16 = v13;
  v32 = v16;
  objc_msgSend(v14, "addObserverBlock:", v31);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = v15;
  v25[1] = 3221225472;
  v25[2] = __71__PUPickerPrincipalUIViewController_showProgress_forAsset_progressURL___block_invoke_3;
  v25[3] = &unk_1E589AC90;
  objc_copyWeak(&v30, &location);
  v26 = v8;
  v27 = v10;
  v28 = v16;
  v29 = v17;
  v18 = v17;
  v19 = v16;
  v20 = v10;
  v21 = v8;
  v22 = _Block_copy(v25);
  v23 = _Block_copy(v22);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

  return v23;
}

- (void)finishProgress:(id)a3 progressURL:(id)a4 trackingID:(id)a5 observation:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_msgSend(v13, "isCancelled");
  -[PUPickerPrincipalUIViewController loadingStatusManager](self, "loadingStatusManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14)
    objc_msgSend(v15, "didCancelLoadOperationWithTrackingID:", v11);
  else
    objc_msgSend(v15, "didCompleteLoadOperationWithTrackingID:withSuccess:error:", v11, 1, 0);

  objc_msgSend(v13, "removeObservation:", v10);
  v17 = (void *)MEMORY[0x1E0CB38A8];
  -[PUPickerPrincipalUIViewController progressSubscribers](self, "progressSubscribers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeSubscriber:", v19);

  -[PUPickerPrincipalUIViewController progressSubscribers](self, "progressSubscribers");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", 0, v12);

}

- (void)finishPicking:(id)a3 additionalSelectionState:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  int v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t j;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  char v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  char v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  id obj;
  void *v88;
  char v89;
  uint64_t v90;
  int v91;
  id v92;
  uint64_t v93;
  void *context;
  uint64_t v95;
  id v96;
  id v97;
  id v98;
  void *v99;
  void *v100;
  id v101;
  PUPickerPrincipalUIViewController *val;
  uint64_t v103;
  _QWORD v104[6];
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  id location;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _QWORD v115[5];
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _BYTE v122[128];
  _BYTE v123[128];
  __int128 buf;
  __int128 v125;
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v84 = a3;
  v82 = a4;
  val = self;
  -[PUPickerPrincipalUIViewController extensionContext](self, "extensionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_auxiliaryConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxy");
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPickerPrincipalUIViewController coordinator](val, "coordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configuration");
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v82, "registerConfiguration");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerPrincipalUIViewController coordinator](val, "coordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "isShowingLiveWallpaperSuggestions");
  PXPickerFileProviderRegisterConfigurationSetIsLiveWallpaperSuggestion();

  v10 = objc_alloc(MEMORY[0x1E0C99E60]);
  PXMap();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = v11;
  else
    v13 = MEMORY[0x1E0C9AA60];
  v81 = (void *)objc_msgSend(v10, "initWithArray:", v13);

  -[PUPickerPrincipalUIViewController programmaticallySelectedItemIdentifiers](val, "programmaticallySelectedItemIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "intersectSet:", v81);

  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  -[PUPickerPrincipalUIViewController progressSubscribers](val, "progressSubscribers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v118, v126, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v119;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v119 != v18)
          objc_enumerationMutation(v16);
        objc_msgSend(MEMORY[0x1E0CB38A8], "removeSubscriber:", *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * i));
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v118, v126, 16);
    }
    while (v17);
  }

  -[PUPickerPrincipalUIViewController progressSubscribers](val, "progressSubscribers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeAllObjects");

  -[PUPickerPrincipalUIViewController coordinator](val, "coordinator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "emitDidFinishPickingAnalytics");

  if (objc_msgSend(v88, "isLimitedLibraryPicker"))
  {
    PXMap();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "limitedLibraryClientIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = 0u;
    v117 = 0u;
    objc_msgSend(v88, "pickerClientIdentification");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      objc_msgSend(v24, "clientAuditToken");
    }
    else
    {
      v116 = 0u;
      v117 = 0u;
    }

    PLPickerGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v23;
      _os_log_impl(&dword_1AAB61000, v26, OS_LOG_TYPE_DEFAULT, "Sending updated limited library for application %@", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(v88, "photoLibrary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "assetsdClient");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "libraryInternalClient");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v115[0] = MEMORY[0x1E0C809B0];
    v115[1] = 3221225472;
    v115[2] = __76__PUPickerPrincipalUIViewController_finishPicking_additionalSelectionState___block_invoke_185;
    v115[3] = &unk_1E58AB060;
    v115[4] = v23;
    buf = v116;
    v125 = v117;
    objc_msgSend(v29, "setFetchFilterWithAssets:forApplication:withAuditToken:completionHandler:", v22, v23, &buf, v115);

    objc_msgSend(v84, "fetchedObjectIDsSet");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "mutableCopy");

    objc_msgSend(v88, "preselectedItemObjectIDs");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "set");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "minusSet:", v33);

    v34 = objc_alloc(MEMORY[0x1E0CD1620]);
    objc_msgSend(v31, "allObjects");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "initWithExistingFetchResult:filteredObjectIDs:", v84, v35);

    v84 = (id)v36;
  }
  v37 = objc_msgSend(v88, "confirmationBehavior");
  if (v37 <= 4 && ((1 << v37) & 0x13) != 0)
  {
    -[PUPickerPrincipalUIViewController coordinator](val, "coordinator");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "resignSearchBarAsFirstResponder");

  }
  if (objc_msgSend(v84, "count"))
  {
    v91 = objc_msgSend(v88, "allowsAssetData");
    v89 = objc_msgSend(v88, "allowsIdentifiers");
    -[PUPickerPrincipalUIViewController programmaticallySelectedItemIdentifiers](val, "programmaticallySelectedItemIdentifiers");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerPrincipalUIViewController manager](val, "manager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerPrincipalUIViewController domain](val, "domain");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    PXPickerFileProviderRegister();
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    v92 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    obj = v84;
    v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v123, 16);
    if (v93)
    {
      v90 = *(_QWORD *)v112;
      do
      {
        v41 = 0;
        do
        {
          if (*(_QWORD *)v112 != v90)
          {
            v42 = v41;
            objc_enumerationMutation(obj);
            v41 = v42;
          }
          v95 = v41;
          v43 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v111 + 1) + 8 * v41));
          context = (void *)MEMORY[0x1AF42B2C0]();
          v96 = v43;
          if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
            v98 = v96;
          else
            v98 = 0;

          v97 = objc_alloc_init(MEMORY[0x1E0CD21F0]);
          if (v98)
            v44 = v91;
          else
            v44 = 0;
          if (v44 == 1)
          {
            objc_msgSend(v98, "localIdentifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v86, "containsObject:", v45);

            if ((v46 & 1) == 0)
            {
              v116 = 0u;
              v117 = 0u;
              objc_msgSend(v88, "pickerClientIdentification");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = v47;
              if (v47)
              {
                objc_msgSend(v47, "clientAuditToken");
              }
              else
              {
                v116 = 0u;
                v117 = 0u;
              }

              objc_msgSend(v98, "originalFilename");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "stringByDeletingPathExtension");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "setSuggestedName:", v50);

              objc_msgSend(v88, "phPickerConfiguration");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "setAllowsItemProviderOpenInPlace:", objc_msgSend(v51, "_usesOpenPanelLayout"));

              objc_msgSend(v97, "setPixelWidth:", objc_msgSend(v98, "pixelWidth"));
              objc_msgSend(v97, "setPixelHeight:", objc_msgSend(v98, "pixelHeight"));
              objc_msgSend(v98, "preferredCropRect");
              objc_msgSend(v97, "setPreferredCropRect:");
              objc_msgSend(v98, "acceptableCropRect");
              objc_msgSend(v97, "setAcceptableCropRect:");
              objc_msgSend(v98, "faceAreaRect");
              objc_msgSend(v97, "setNormalizedFaceAreaRect:");
              objc_initWeak(&location, val);
              PXPhotosFileProviderRegisteredFileRepresentations();
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v52, "count"));
              v99 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v52, "count"));
              v100 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v52, "count"));
              v108 = 0u;
              v109 = 0u;
              v106 = 0u;
              v107 = 0u;
              v101 = v52;
              v54 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v106, v122, 16);
              if (v54)
              {
                v103 = *(_QWORD *)v107;
                do
                {
                  for (j = 0; j != v54; ++j)
                  {
                    if (*(_QWORD *)v107 != v103)
                      objc_enumerationMutation(v101);
                    v56 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * j);
                    PXPhotosFileProviderRegisterFileRepresentationTypeIdentifier();
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v53, "containsObject:", v57) & 1) == 0)
                    {
                      MEMORY[0x1AF42A600](v56);
                      v58 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v58, "path");
                      v59 = (void *)objc_claimAutoreleasedReturnValue();
                      buf = v116;
                      v125 = v117;
                      PLGetSandboxExtensionTokenForProcess();
                      v60 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                      v61 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v58, "path");
                      v62 = (void *)objc_claimAutoreleasedReturnValue();
                      v63 = objc_msgSend(v61, "fileExistsAtPath:", v62);

                      if ((v63 & 1) == 0)
                      {
                        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                        v64 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v58, "path");
                        v65 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v64, "createFileAtPath:contents:attributes:", v65, 0, 0);

                      }
                      -[PUPickerPrincipalUIViewController progressSubscribers](val, "progressSubscribers");
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v66, "objectForKeyedSubscript:", v58);
                      v67 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v67)
                      {

                      }
                      else
                      {
                        v68 = MEMORY[0x1AF42A60C](v56);

                        if ((v68 & 1) == 0)
                        {
                          v69 = (void *)MEMORY[0x1E0CB38A8];
                          v104[0] = MEMORY[0x1E0C809B0];
                          v104[1] = 3221225472;
                          v104[2] = __76__PUPickerPrincipalUIViewController_finishPicking_additionalSelectionState___block_invoke_193;
                          v104[3] = &unk_1E589ACF8;
                          objc_copyWeak(&v105, &location);
                          v104[4] = v98;
                          v104[5] = v58;
                          objc_msgSend(v69, "addSubscriberForFileURL:withPublishingHandler:", v58, v104);
                          v70 = (void *)objc_claimAutoreleasedReturnValue();
                          -[PUPickerPrincipalUIViewController progressSubscribers](val, "progressSubscribers");
                          v71 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v71, "setObject:forKeyedSubscript:", v70, v58);

                          objc_destroyWeak(&v105);
                        }
                      }
                      objc_msgSend(v53, "addObject:", v57);
                      objc_msgSend(v100, "setObject:forKeyedSubscript:", v60, v57);
                      objc_msgSend(v99, "setObject:forKeyedSubscript:", v58, v57);

                    }
                  }
                  v54 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v106, v122, 16);
                }
                while (v54);
              }

              v72 = (void *)objc_msgSend(v53, "copy");
              objc_msgSend(v97, "setTypeIdentifiers:", v72);

              v73 = (void *)objc_msgSend(v99, "copy");
              objc_msgSend(v97, "setFilePromiseURLs:", v73);

              v74 = (void *)objc_msgSend(v100, "copy");
              objc_msgSend(v97, "setSandboxExtensionTokens:", v74);

              objc_destroyWeak(&location);
            }
          }
          v75 = objc_alloc(MEMORY[0x1E0CD2178]);
          v76 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
          if ((v89 & 1) != 0)
          {
            objc_msgSend(v96, "localIdentifier");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = (void *)objc_msgSend(v75, "_initWithItemProvider:itemIdentifier:isAssetResult:metadata:", v76, v77, v98 != 0, v97);

          }
          else
          {
            v78 = (void *)objc_msgSend(v75, "_initWithItemProvider:itemIdentifier:isAssetResult:metadata:", v76, 0, v98 != 0, v97);
          }

          objc_msgSend(v92, "addObject:", v78);
          objc_autoreleasePoolPop(context);
          v41 = v95 + 1;
        }
        while (v95 + 1 != v93);
        v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v123, 16);
      }
      while (v93);
    }

    -[PUPickerPrincipalUIViewController logExitIfNeeded:](val, "logExitIfNeeded:", obj);
    v79 = (void *)objc_msgSend(v92, "copy");
    objc_msgSend(v80, "_pickerDidFinishPicking:", v79);

  }
  else
  {
    objc_msgSend(v80, "_pickerDidFinishPicking:", 0);
  }

}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 493, CFSTR("%s must be called on the main thread"), "-[PUPickerPrincipalUIViewController beginRequestWithExtensionContext:]");

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 494, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[context isKindOfClass:PUPickerExtensionVendorContext.class]"));

  }
  v23.receiver = self;
  v23.super_class = (Class)PUPickerPrincipalUIViewController;
  v6 = -[PUPickerPrincipalUIViewController beginRequestWithExtensionContext:](&v23, sel_beginRequestWithExtensionContext_, v5);
  if (MEMORY[0x1AF42B6B0](v6))
  {
    -[PUPickerPrincipalUIViewController extensionContext](self, "extensionContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_auxiliaryConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PLClientApplicationIdentifierFromXPCConnection();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    MEMORY[0x1AF42B6BC](v9);
  }
  PXSynchronousAddPickerFileProviderDomain();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  -[PUPickerPrincipalUIViewController setDomain:](self, "setDomain:", v10);

  -[PUPickerPrincipalUIViewController setDomainError:](self, "setDomainError:", v11);
  -[PUPickerPrincipalUIViewController domain](self, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CAAD28];
    -[PUPickerPrincipalUIViewController domain](self, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "managerForDomain:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerPrincipalUIViewController setManager:](self, "setManager:", v15);

  }
  else
  {
    -[PUPickerPrincipalUIViewController setManager:](self, "setManager:", 0);
  }

  v16 = objc_alloc_init(MEMORY[0x1E0D7CD28]);
  -[PUPickerPrincipalUIViewController setLoadingStatusManager:](self, "setLoadingStatusManager:", v16);

  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PUPickerPrincipalUIViewController setProgressSubscribers:](self, "setProgressSubscribers:", v17);

  PXAsynchronousAddDragAndDropFileProviderDomain();
  objc_msgSend(v5, "setDelegate:", self);
  v18 = (void *)MEMORY[0x1E0CD21D0];
  objc_msgSend(v5, "_auxiliaryConnection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "remoteObjectInterface");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAllowedClassesForExtensionAuxiliaryHostInterface:", v20);

}

- (void)_pickerUnavailableViewControllerCancelButtonTapped:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 536, CFSTR("%s must be called on the main thread"), "-[PUPickerPrincipalUIViewController _pickerUnavailableViewControllerCancelButtonTapped:]");

  }
  -[PUPickerPrincipalUIViewController extensionContext](self, "extensionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_auxiliaryConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "_pickerDidFinishPicking:", 0);
}

- (void)_updateConfiguration:(id)a3 completionHandler:(id)a4
{
  void (**v7)(id, _QWORD);
  void *v8;
  PUPickerConfiguration *v9;
  void *v10;
  void *v11;
  PUPickerConfiguration *v12;
  void *v13;
  _BOOL4 v14;
  _BOOL4 v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  id v19;

  v19 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 545, CFSTR("%s must be called on the main thread"), "-[PUPickerPrincipalUIViewController _updateConfiguration:completionHandler:]");

  }
  if (v19)
  {
    -[PUPickerPrincipalUIViewController configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unregisterChangeObserver:context:", self, PUPickerConfigurationObservationContext);

    v9 = [PUPickerConfiguration alloc];
    -[PUPickerPrincipalUIViewController extensionContext](self, "extensionContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_auxiliaryConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PUPickerConfiguration initWithPHPickerConfiguration:connection:](v9, "initWithPHPickerConfiguration:connection:", v19, v11);
    -[PUPickerPrincipalUIViewController setConfiguration:](self, "setConfiguration:", v12);

    -[PUPickerPrincipalUIViewController configuration](self, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerChangeObserver:context:", self, PUPickerConfigurationObservationContext);

  }
  v14 = -[PUPickerPrincipalUIViewController updatePicker](self, "updatePicker");
  if (v7)
  {
    v15 = v14;
    -[PUPickerPrincipalUIViewController configuration](self, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      v17 = v15;
    else
      v17 = 0;
    v7[2](v7, v17);

  }
}

- (void)_updatePickerUsingUpdateConfiguration:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  NSObject *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (!v5)
      goto LABEL_6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 561, CFSTR("%s must be called on the main thread"), "-[PUPickerPrincipalUIViewController _updatePickerUsingUpdateConfiguration:]");

    if (!v5)
      goto LABEL_6;
  }
  if (objc_msgSend(v5, "_isValidConfiguration"))
  {
    -[PUPickerPrincipalUIViewController configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __75__PUPickerPrincipalUIViewController__updatePickerUsingUpdateConfiguration___block_invoke;
    v9[3] = &unk_1E589AD20;
    v10 = v5;
    objc_msgSend(v6, "performChanges:", v9);

    v7 = v10;
    goto LABEL_8;
  }
LABEL_6:
  PLPickerGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v12 = v5;
    v13 = 2080;
    v14 = "-[PUPickerPrincipalUIViewController _updatePickerUsingUpdateConfiguration:]";
    _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "Invalid inputs (%@) received: %s", buf, 0x16u);
  }
LABEL_8:

}

- (void)_hostModalInPresentationDidChange:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 578, CFSTR("%s must be called on the main thread"), "-[PUPickerPrincipalUIViewController _hostModalInPresentationDidChange:]");

  }
  if (-[PUPickerPrincipalUIViewController isModalInPresentation](self, "isModalInPresentation") != v3)
    -[PUPickerPrincipalUIViewController setModalInPresentation:](self, "setModalInPresentation:", v3);
}

- (void)_startActivityIndicatorsForAssetsWithIdentifiers:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (!v5)
      goto LABEL_6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 597, CFSTR("%s must be called on the main thread"), "-[PUPickerPrincipalUIViewController _startActivityIndicatorsForAssetsWithIdentifiers:]");

    if (!v5)
      goto LABEL_6;
  }
  -[PUPickerPrincipalUIViewController coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "receivedPhotoLibrary");

  if (v8)
  {
    -[PUPickerPrincipalUIViewController configuration](self, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "librarySpecificFetchOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v5, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerPrincipalUIViewController coordinator](self, "coordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startActivityIndicatorsForAssetsWithFetchResult:", v12);

    goto LABEL_9;
  }
LABEL_6:
  PLPickerGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v5;
    v18 = 2080;
    v19 = "-[PUPickerPrincipalUIViewController _startActivityIndicatorsForAssetsWithIdentifiers:]";
    _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_ERROR, "Invalid inputs (%@) received: %s", buf, 0x16u);
  }

LABEL_9:
}

- (void)_stopActivityIndicatorsForAssetsWithIdentifiers:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (!v5)
      goto LABEL_6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 609, CFSTR("%s must be called on the main thread"), "-[PUPickerPrincipalUIViewController _stopActivityIndicatorsForAssetsWithIdentifiers:]");

    if (!v5)
      goto LABEL_6;
  }
  -[PUPickerPrincipalUIViewController coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "receivedPhotoLibrary");

  if (v8)
  {
    -[PUPickerPrincipalUIViewController coordinator](self, "coordinator");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject stopActivityIndicatorsForAssetsWithIdentifiers:](v9, "stopActivityIndicatorsForAssetsWithIdentifiers:", v5);
    goto LABEL_8;
  }
LABEL_6:
  PLPickerGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v12 = v5;
    v13 = 2080;
    v14 = "-[PUPickerPrincipalUIViewController _stopActivityIndicatorsForAssetsWithIdentifiers:]";
    _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "Invalid inputs (%@) received: %s", buf, 0x16u);
  }
LABEL_8:

}

- (void)_deselectAssetsWithIdentifiers:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 619, CFSTR("%s must be called on the main thread"), "-[PUPickerPrincipalUIViewController _deselectAssetsWithIdentifiers:]");

  }
  if (objc_msgSend(v5, "count")
    && (-[PUPickerPrincipalUIViewController coordinator](self, "coordinator"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "configuration"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "receivedPhotoLibrary"),
        v7,
        v6,
        v8))
  {
    -[PUPickerPrincipalUIViewController coordinator](self, "coordinator");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject deselectAssetsWithIdentifiers:](v9, "deselectAssetsWithIdentifiers:", v5);
  }
  else
  {
    PLPickerGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v12 = v5;
      v13 = 2080;
      v14 = "-[PUPickerPrincipalUIViewController _deselectAssetsWithIdentifiers:]";
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "Invalid inputs (%@) received: %s", buf, 0x16u);
    }
  }

}

- (void)_moveAssetWithIdentifier:(id)a3 afterIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (!v7)
      goto LABEL_6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 629, CFSTR("%s must be called on the main thread"), "-[PUPickerPrincipalUIViewController _moveAssetWithIdentifier:afterIdentifier:]");

    if (!v7)
      goto LABEL_6;
  }
  -[PUPickerPrincipalUIViewController coordinator](self, "coordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "receivedPhotoLibrary");

  if (v11)
  {
    -[PUPickerPrincipalUIViewController coordinator](self, "coordinator");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject moveAssetWithIdentifier:afterIdentifier:](v12, "moveAssetWithIdentifier:afterIdentifier:", v7, v8);
    goto LABEL_8;
  }
LABEL_6:
  PLPickerGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2080;
    v19 = "-[PUPickerPrincipalUIViewController _moveAssetWithIdentifier:afterIdentifier:]";
    _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_ERROR, "Invalid inputs (%@, %@) received: %s", buf, 0x20u);
  }
LABEL_8:

}

- (void)_updateSelectedAssetsWithIdentifiers:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 639, CFSTR("%s must be called on the main thread"), "-[PUPickerPrincipalUIViewController _updateSelectedAssetsWithIdentifiers:]");

  }
  -[PUPickerPrincipalUIViewController coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "sourceType");

  if (v8)
  {
    PLPickerGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[PUPickerPrincipalUIViewController coordinator](self, "coordinator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      v19 = objc_msgSend(v11, "sourceType");
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEBUG, "Skipping _updateSelectedAssetsWithIdentifiers for %ld picker", buf, 0xCu);

    }
  }
  else
  {
    if (v5
      && (-[PUPickerPrincipalUIViewController coordinator](self, "coordinator"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v12, "configuration"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "receivedPhotoLibrary"),
          v13,
          v12,
          v14))
    {
      -[PUPickerPrincipalUIViewController programmaticallySelectedItemIdentifiers](self, "programmaticallySelectedItemIdentifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObjectsFromArray:", v5);

      -[PUPickerPrincipalUIViewController coordinator](self, "coordinator");
      v16 = objc_claimAutoreleasedReturnValue();
      -[NSObject updateSelectedAssetsWithIdentifiers:](v16, "updateSelectedAssetsWithIdentifiers:", v5);
    }
    else
    {
      PLPickerGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v19 = (uint64_t)v5;
        v20 = 2080;
        v21 = "-[PUPickerPrincipalUIViewController _updateSelectedAssetsWithIdentifiers:]";
        _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_ERROR, "Invalid inputs (%@) received: %s", buf, 0x16u);
      }
    }

  }
}

- (void)_searchWithString:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (v5)
    {
LABEL_3:
      -[PUPickerPrincipalUIViewController coordinator](self, "coordinator");
      v6 = objc_claimAutoreleasedReturnValue();
      -[NSObject searchWithString:](v6, "searchWithString:", v5);
      goto LABEL_7;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 656, CFSTR("%s must be called on the main thread"), "-[PUPickerPrincipalUIViewController _searchWithString:]");

    if (v5)
      goto LABEL_3;
  }
  PLPickerGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v9 = 0;
    v10 = 2080;
    v11 = "-[PUPickerPrincipalUIViewController _searchWithString:]";
    _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Invalid inputs (%@) received: %s", buf, 0x16u);
  }
LABEL_7:

}

- (void)_popViewControllerWithReply:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 666, CFSTR("%s must be called on the main thread"), "-[PUPickerPrincipalUIViewController _popViewControllerWithReply:]");

  }
  -[PUPickerPrincipalUIViewController coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "popViewController");

  v7 = v9;
  if (v9)
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, v6);
    v7 = v9;
  }

}

- (void)_scrollContentToInitialPosition
{
  void *v4;
  id v5;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 675, CFSTR("%s must be called on the main thread"), "-[PUPickerPrincipalUIViewController _scrollContentToInitialPosition]");

  }
  -[PUPickerPrincipalUIViewController coordinator](self, "coordinator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollContentToInitialPosition");

}

- (void)_zoomInContent
{
  void *v4;
  id v5;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 681, CFSTR("%s must be called on the main thread"), "-[PUPickerPrincipalUIViewController _zoomInContent]");

  }
  -[PUPickerPrincipalUIViewController coordinator](self, "coordinator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoomInContent");

}

- (void)_zoomOutContent
{
  void *v4;
  id v5;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 687, CFSTR("%s must be called on the main thread"), "-[PUPickerPrincipalUIViewController _zoomOutContent]");

  }
  -[PUPickerPrincipalUIViewController coordinator](self, "coordinator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoomOutContent");

}

- (void)coordinator:(id)a3 didFinishPicking:(id)a4 additionalSelectionState:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  _QWORD v48[5];
  id v49;
  void *v50;
  id v51;
  id v52;
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (v9)
      goto LABEL_3;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 696, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coordinator != nil"));

    if (v11)
      goto LABEL_4;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 695, CFSTR("%s must be called on the main thread"), "-[PUPickerPrincipalUIViewController coordinator:didFinishPicking:additionalSelectionState:]");

  if (!v9)
    goto LABEL_14;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 697, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("additionalSelectionState != nil"));

LABEL_4:
  -[PUPickerPrincipalUIViewController selectionDate](self, "selectionDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerPrincipalUIViewController setSelectionDate:](self, "setSelectionDate:", v13);

  -[PUPickerPrincipalUIViewController selectedObjectIDs](self, "selectedObjectIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[PUPickerPrincipalUIViewController shouldDebounceDidFinishPicking:previousSelectedObjectIDs:previousSelectionDate:](PUPickerPrincipalUIViewController, "shouldDebounceDidFinishPicking:previousSelectedObjectIDs:previousSelectionDate:", v10, v14, v12))
  {
    v44 = v12;
    v45 = v9;
    v15 = objc_alloc(MEMORY[0x1E0CD1620]);
    objc_msgSend(v10, "array");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = v16;
    else
      v18 = MEMORY[0x1E0C9AA60];
    -[PUPickerPrincipalUIViewController coordinator](self, "coordinator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "configuration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "photoLibrary");
    v46 = v11;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerPrincipalUIViewController configuration](self, "configuration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "fetchType");
    v47 = v10;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v15, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v18, v21, v23, 0, 0, 0);

    v25 = (void *)objc_msgSend(v47, "mutableCopy");
    v43 = v14;
    objc_msgSend(v25, "minusOrderedSet:", v14);
    v26 = objc_alloc(MEMORY[0x1E0CD1620]);
    v42 = v25;
    objc_msgSend(v25, "array");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    if (v27)
      v29 = v27;
    else
      v29 = MEMORY[0x1E0C9AA60];
    -[PUPickerPrincipalUIViewController coordinator](self, "coordinator");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "configuration");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "photoLibrary");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerPrincipalUIViewController configuration](self, "configuration");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "fetchType");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v26;
    v36 = (void *)v24;
    v37 = v29;
    v10 = v47;
    v38 = (void *)objc_msgSend(v35, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v37, v32, v34, 0, 0, 0);

    v11 = v46;
    objc_initWeak(&location, self);
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __91__PUPickerPrincipalUIViewController_coordinator_didFinishPicking_additionalSelectionState___block_invoke;
    v48[3] = &unk_1E589AD48;
    objc_copyWeak(&v52, &location);
    v48[4] = v38;
    v49 = v47;
    v50 = v36;
    v51 = v46;
    -[PUPickerPrincipalUIViewController confirmUserSafetyIntervention:completionHandler:](self, "confirmUserSafetyIntervention:completionHandler:", v38, v48);

    objc_destroyWeak(&v52);
    objc_destroyWeak(&location);

    v12 = v44;
    v9 = v45;
    v14 = v43;
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v6 = a4;
  v9 = a3;
  if ((void *)PUPickerConfigurationObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerPrincipalUIViewController.m"), 755, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v19 = v9;
  if ((v6 & 4) != 0)
  {
    -[PUPickerPrincipalUIViewController extensionContext](self, "extensionContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_auxiliaryConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteObjectProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPickerPrincipalUIViewController configuration](self, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_pickerDidSetOnboardingOverlayDismissed:", objc_msgSend(v13, "didDismissOnboardingOverlayView"));

    v9 = v19;
  }
  if ((v6 & 8) != 0)
  {
    -[PUPickerPrincipalUIViewController extensionContext](self, "extensionContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_auxiliaryConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "remoteObjectProxy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPickerPrincipalUIViewController configuration](self, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_pickerDidSetOnboardingHeaderDismissed:", objc_msgSend(v17, "didDismissOnboardingHeaderView"));

    v9 = v19;
  }

}

- (PUPickerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (NSError)configurationError
{
  return self->_configurationError;
}

- (void)setConfigurationError:(id)a3
{
  objc_storeStrong((id *)&self->_configurationError, a3);
}

- (NSFileProviderManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (NSFileProviderDomain)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (NSError)domainError
{
  return self->_domainError;
}

- (void)setDomainError:(id)a3
{
  objc_storeStrong((id *)&self->_domainError, a3);
}

- (PUPickerCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_coordinator, a3);
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topConstraint, a3);
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomConstraint, a3);
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (void)setLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingConstraint, a3);
}

- (NSLayoutConstraint)trailingConstraint
{
  return self->_trailingConstraint;
}

- (void)setTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingConstraint, a3);
}

- (NSLayoutConstraint)leadingSafeAreaConstraint
{
  return self->_leadingSafeAreaConstraint;
}

- (void)setLeadingSafeAreaConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingSafeAreaConstraint, a3);
}

- (NSLayoutConstraint)trailingSafeAreaConstraint
{
  return self->_trailingSafeAreaConstraint;
}

- (void)setTrailingSafeAreaConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingSafeAreaConstraint, a3);
}

- (NSMutableSet)programmaticallySelectedItemIdentifiers
{
  return self->_programmaticallySelectedItemIdentifiers;
}

- (void)setProgrammaticallySelectedItemIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_programmaticallySelectedItemIdentifiers, a3);
}

- (NSOrderedSet)selectedObjectIDs
{
  return self->_selectedObjectIDs;
}

- (void)setSelectedObjectIDs:(id)a3
{
  objc_storeStrong((id *)&self->_selectedObjectIDs, a3);
}

- (NSDate)selectionDate
{
  return self->_selectionDate;
}

- (void)setSelectionDate:(id)a3
{
  objc_storeStrong((id *)&self->_selectionDate, a3);
}

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->_loadingStatusManager;
}

- (void)setLoadingStatusManager:(id)a3
{
  objc_storeStrong((id *)&self->_loadingStatusManager, a3);
}

- (NSMutableDictionary)progressSubscribers
{
  return self->_progressSubscribers;
}

- (void)setProgressSubscribers:(id)a3
{
  objc_storeStrong((id *)&self->_progressSubscribers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressSubscribers, 0);
  objc_storeStrong((id *)&self->_loadingStatusManager, 0);
  objc_storeStrong((id *)&self->_selectionDate, 0);
  objc_storeStrong((id *)&self->_selectedObjectIDs, 0);
  objc_storeStrong((id *)&self->_programmaticallySelectedItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_trailingSafeAreaConstraint, 0);
  objc_storeStrong((id *)&self->_leadingSafeAreaConstraint, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_domainError, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_configurationError, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

void __91__PUPickerPrincipalUIViewController_coordinator_didFinishPicking_additionalSelectionState___block_invoke(uint64_t a1, int a2)
{
  id *v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  if (a2)
  {
    v3 = (id *)(a1 + 64);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v5 = *(_QWORD *)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __91__PUPickerPrincipalUIViewController_coordinator_didFinishPicking_additionalSelectionState___block_invoke_2;
    v11[3] = &unk_1E58A4B38;
    objc_copyWeak(&v15, v3);
    v6 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(void **)(a1 + 56);
    v12 = v6;
    v13 = v7;
    v14 = v8;
    objc_msgSend(WeakRetained, "confirmConfidentialWarning:completionHandler:", v5, v11);

    objc_destroyWeak(&v15);
  }
  else
  {
    PLPickerGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEFAULT, "Aborted picking after confidential warning.", v10, 2u);
    }

  }
}

void __91__PUPickerPrincipalUIViewController_coordinator_didFinishPicking_additionalSelectionState___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3;
  id *v4;
  id WeakRetained;
  NSObject *v6;
  id v7;
  uint8_t buf[16];

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = (id *)(a1 + 56);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "setSelectedObjectIDs:", v3);

    v7 = objc_loadWeakRetained(v4);
    objc_msgSend(v7, "finishPicking:additionalSelectionState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  else
  {
    PLPickerGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "Aborted picking after user safety intervention.", buf, 2u);
    }

  }
}

void __75__PUPickerPrincipalUIViewController__updatePickerUsingUpdateConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_didSetEdgesWithoutContentMargins"))
    objc_msgSend(v3, "setEdgesWithoutContentMargins:", objc_msgSend(*(id *)(a1 + 32), "edgesWithoutContentMargins"));
  if (objc_msgSend(*(id *)(a1 + 32), "_didSetSelectionLimit"))
    objc_msgSend(v3, "setSelectionLimit:", objc_msgSend(*(id *)(a1 + 32), "selectionLimit"));

}

void __76__PUPickerPrincipalUIViewController_finishPicking_additionalSelectionState___block_invoke_185(uint64_t a1, int a2, void *a3)
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
  PLPickerGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v14 = 138412290;
      v15 = v8;
      v9 = "Finished updating limited library for application %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1AAB61000, v10, v11, v9, (uint8_t *)&v14, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = 138412546;
    v15 = v13;
    v16 = 2112;
    v17 = v5;
    v9 = "Failed to update limited library for application %@ with error %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
    goto LABEL_6;
  }

}

id __76__PUPickerPrincipalUIViewController_finishPicking_additionalSelectionState___block_invoke_193(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "showProgress:forAsset:progressURL:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __76__PUPickerPrincipalUIViewController_finishPicking_additionalSelectionState___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localIdentifier");
}

uint64_t __76__PUPickerPrincipalUIViewController_finishPicking_additionalSelectionState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localIdentifier");
}

void __71__PUPickerPrincipalUIViewController_showProgress_forAsset_progressURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a2;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  v5 = v3;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v6);
}

void __71__PUPickerPrincipalUIViewController_showProgress_forAsset_progressURL___block_invoke_3(id *a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;

  objc_copyWeak(&v6, a1 + 8);
  v2 = a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v6);
}

void __71__PUPickerPrincipalUIViewController_showProgress_forAsset_progressURL___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "finishProgress:progressURL:trackingID:observation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __71__PUPickerPrincipalUIViewController_showProgress_forAsset_progressURL___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "loadingStatusManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "doubleValue");
  objc_msgSend(v2, "didUpdateLoadOperationWithTrackingID:withProgress:", v3);

}

void __85__PUPickerPrincipalUIViewController_confirmUserSafetyIntervention_completionHandler___block_invoke(id *a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(a1[4], "coordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "fetchedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopActivityIndicatorsForAssetsWithIdentifiers:", v6);

  if (a2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __85__PUPickerPrincipalUIViewController_confirmUserSafetyIntervention_completionHandler___block_invoke_3;
    v7[3] = &unk_1E58AA518;
    v8 = a1[6];
    +[PUPickerUtilities presentUserSafetyViewControllerWithCompletionHandler:](PUPickerUtilities, "presentUserSafetyViewControllerWithCompletionHandler:", v7);

  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }
}

uint64_t __85__PUPickerPrincipalUIViewController_confirmUserSafetyIntervention_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__PUPickerPrincipalUIViewController_confirmUserSafetyIntervention_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localIdentifier");
}

uint64_t __82__PUPickerPrincipalUIViewController_confirmConfidentialWarning_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __82__PUPickerPrincipalUIViewController_confirmConfidentialWarning_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __53__PUPickerPrincipalUIViewController_logExitIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CD1698];
  objc_msgSend(a2, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuidFromLocalIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __49__PUPickerPrincipalUIViewController_updatePicker__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateModalInPresentation");

}

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_1468);
}

+ (BOOL)shouldDebounceDidFinishPicking:(id)a3 previousSelectedObjectIDs:(id)a4 previousSelectionDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  BOOL v11;
  double v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7 == v8)
    v10 = 1;
  else
    v10 = objc_msgSend(v7, "isEqual:", v8);
  v11 = 0;
  if (v9 && v10)
  {
    objc_msgSend(v9, "timeIntervalSinceNow");
    v11 = fabs(v12) < 0.3;
  }

  return v11;
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

void __47__PUPickerPrincipalUIViewController_initialize__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D7B930], "setSuiteName:", CFSTR("com.apple.mobileslideshow"));
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "removeObjectForKey:", CFSTR("UIBarsApplyChromelessEverywhere"));

}

@end
