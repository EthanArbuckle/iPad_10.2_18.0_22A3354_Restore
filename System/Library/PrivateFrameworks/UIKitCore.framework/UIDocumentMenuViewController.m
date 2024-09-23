@implementation UIDocumentMenuViewController

- (UIDocumentMenuViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99778];
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = objc_opt_class();
  NSStringFromSelector(sel_initWithDocumentTypes_inMode_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithURL_inMode_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("You cannot initialize a %@ except by the %@ and %@ initializers."), v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v13, 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v14);
}

- (UIDocumentMenuViewController)initWithDocumentTypes:(NSArray *)allowedUTIs inMode:(UIDocumentPickerMode)mode
{
  NSArray *v7;
  UIDocumentMenuViewController *v8;
  UIDocumentMenuViewController *v9;
  void *v11;
  _QWORD v12[4];
  NSArray *v13;
  UIDocumentPickerMode v14;
  objc_super v15;

  v7 = allowedUTIs;
  if (mode >= UIDocumentPickerModeExportToService)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentMenuViewController.m"), 73, CFSTR("%s can only be called with mode Import or Open"), "-[UIDocumentMenuViewController initWithDocumentTypes:inMode:]");

  }
  v15.receiver = self;
  v15.super_class = (Class)UIDocumentMenuViewController;
  v8 = -[UIViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    -[UIDocumentMenuViewController setDocumentPickerMode:](v8, "setDocumentPickerMode:", mode);
    -[UIDocumentMenuViewController setAllowedUTIs:](v9, "setAllowedUTIs:", v7);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__UIDocumentMenuViewController_initWithDocumentTypes_inMode___block_invoke;
    v12[3] = &unk_1E16C35A0;
    v13 = v7;
    v14 = mode;
    -[UIDocumentMenuViewController _commonInitWithCompletion:](v9, "_commonInitWithCompletion:", v12);

  }
  return v9;
}

void __61__UIDocumentMenuViewController_initWithDocumentTypes_inMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "_setPickableTypes:", v3);
  objc_msgSend(v4, "_setPickerMode:", *(_QWORD *)(a1 + 40));

}

- (id)_initIgnoringApplicationEntitlementForImportOfTypes:(id)a3
{
  self->_ignoreApplicationEntitlementForImport = 1;
  return -[UIDocumentMenuViewController initWithDocumentTypes:inMode:](self, "initWithDocumentTypes:inMode:", a3, 0);
}

- (UIDocumentMenuViewController)initWithURL:(NSURL *)url inMode:(UIDocumentPickerMode)mode
{
  NSURL *v7;
  NSURL *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  id v12;
  id v13;
  UIDocumentMenuViewController *v14;
  UIDocumentMenuViewController *v15;
  void *v16;
  id v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  UIDocumentPickerMode v25;
  objc_super v26;
  id v27;
  id v28;

  v7 = url;
  v8 = v7;
  if ((mode & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentMenuViewController.m"), 96, CFSTR("%s can only be called with mode Export or Move"), "-[UIDocumentMenuViewController initWithURL:inMode:]");

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentMenuViewController.m"), 97, CFSTR("%s must be called with a valid URL"), "-[UIDocumentMenuViewController initWithURL:inMode:]");

LABEL_3:
  -[NSURL lastPathComponent](v8, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentMenuViewController.m"), 98, CFSTR("%s must be called with a URL pointing to a file"), "-[UIDocumentMenuViewController initWithURL:inMode:]");

  }
  v28 = 0;
  v10 = *MEMORY[0x1E0C99A90];
  v27 = 0;
  v11 = -[NSURL getPromisedItemResourceValue:forKey:error:](v8, "getPromisedItemResourceValue:forKey:error:", &v28, v10, &v27);
  v12 = v28;
  v13 = v27;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentMenuViewController.m"), 102, CFSTR("%s must be called with a URL pointing to an existing file"), "-[UIDocumentMenuViewController initWithURL:inMode:]");

  }
  v26.receiver = self;
  v26.super_class = (Class)UIDocumentMenuViewController;
  v14 = -[UIViewController initWithNibName:bundle:](&v26, sel_initWithNibName_bundle_, 0, 0);
  v15 = v14;
  if (v14)
  {
    -[UIDocumentMenuViewController setDocumentPickerMode:](v14, "setDocumentPickerMode:", mode);
    -[UIDocumentMenuViewController setUploadURL:](v15, "setUploadURL:", v8);
    +[_UIDocumentPickerNSURLWrapper wrapperWithURL:readonly:](_UIDocumentPickerNSURLWrapper, "wrapperWithURL:readonly:", v8, mode == UIDocumentPickerModeExportToService);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __51__UIDocumentMenuViewController_initWithURL_inMode___block_invoke;
    v23[3] = &unk_1E16C35A0;
    v24 = v16;
    v25 = mode;
    v17 = v16;
    -[UIDocumentMenuViewController _commonInitWithCompletion:](v15, "_commonInitWithCompletion:", v23);

  }
  return v15;
}

void __51__UIDocumentMenuViewController_initWithURL_inMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "_setUploadURLWrapper:", v3);
  objc_msgSend(v4, "_setPickerMode:", *(_QWORD *)(a1 + 40));

}

- (void)_commonInitWithCompletion:(id)a3
{
  unint64_t v3;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void *v29;

  v6 = a3;
  v25 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v7 = _MergedGlobals_1_3;
  v29 = _MergedGlobals_1_3;
  if (!_MergedGlobals_1_3)
  {
    v8 = CloudDocsLibrary_0();
    v7 = dlsym(v8, "BRGetCloudEnabledStatus");
    v27[3] = (uint64_t)v7;
    _MergedGlobals_1_3 = v7;
  }
  _Block_object_dispose(&v26, 8);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BRCloudEnabledStatus _BRGetCloudEnabledStatus(NSError *__autoreleasing *)");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("UIDocumentMenuViewController.m"), 44, CFSTR("%s"), dlerror());
    goto LABEL_13;
  }
  v9 = ((uint64_t (*)(id *))v7)(&v25);
  v10 = v25;
  if (v9 == -3
    && (!self->_ignoreApplicationEntitlementForImport
     || -[UIDocumentMenuViewController documentPickerMode](self, "documentPickerMode")))
  {
    v3 = 0x1E0CB3000uLL;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v12 = (_QWORD *)qword_1ECD79D50;
    v29 = (void *)qword_1ECD79D50;
    if (!qword_1ECD79D50)
    {
      v13 = CloudDocsLibrary_0();
      v12 = dlsym(v13, "BRICloudContainerIdentifiersEntitlement");
      v27[3] = (uint64_t)v12;
      qword_1ECD79D50 = (uint64_t)v12;
    }
    _Block_object_dispose(&v26, 8);
    if (!v12)
    {
      while (1)
      {
        objc_msgSend(*(id *)(v3 + 1160), "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getBRICloudContainerIdentifiersEntitlement(void)");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("UIDocumentMenuViewController.m"), 45, CFSTR("%s"), dlerror());
LABEL_13:

        __break(1u);
      }
    }
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentMenuViewController.m"), 125, CFSTR("Application initializing document picker is missing the iCloud entitlement. Is %@ set?"), *v12);

  }
  -[UIViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", 0, 3.0);
  -[UIDocumentMenuViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 100);
  -[UIViewController setModalTransitionStyle:](self, "setModalTransitionStyle:", 12);
  -[UIViewController actionSheetPresentationController](self, "actionSheetPresentationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Cancel"), CFSTR("Cancel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDismissActionTitle:", v15);

  -[UIViewController actionSheetPresentationController](self, "actionSheetPresentationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActionSheetDelegate:", self);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDocumentMenuViewController setAuxiliaryOptions:](self, "setAuxiliaryOptions:", v17);

  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", CFSTR("com.apple.CloudDocsUI.DocumentPicker"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __58__UIDocumentMenuViewController__commonInitWithCompletion___block_invoke;
  v23[3] = &unk_1E16C35F0;
  v23[4] = self;
  v24 = v6;
  v19 = v6;
  +[_UIResilientRemoteViewContainerViewController instantiateWithExtension:completion:](_UIResilientRemoteViewContainerViewController, "instantiateWithExtension:completion:", v18, v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDocumentMenuViewController _setChildViewController:](self, "_setChildViewController:", v20);
  objc_msgSend(v20, "preferredContentSize");
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:");

}

void __58__UIDocumentMenuViewController__commonInitWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "serviceViewControllerProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (v7)
  {
    v9 = objc_opt_class();
    NSLog(CFSTR("Remote view controller error while displaying %@: %@"), v9, v7);
    objc_msgSend(*(id *)(a1 + 32), "_endDelayingPresentation");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "auxiliaryOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setAuxiliaryOptions:", v10);

    _UIShimSetUnderbarIsContentManaged(v8, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 978));
    objc_msgSend(v6, "setPublicController:", *(_QWORD *)(a1 + 32));
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__UIDocumentMenuViewController__commonInitWithCompletion___block_invoke_2;
    v11[3] = &unk_1E16C35C8;
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v8;
    objc_msgSend(v12, "_prepareForDisplayWithCompletion:", v11);

  }
}

uint64_t __58__UIDocumentMenuViewController__commonInitWithCompletion___block_invoke_2(uint64_t a1, double a2, double a3)
{
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;

  v6 = objc_msgSend(*(id *)(a1 + 32), "modalPresentationStyle");
  v7 = 0.0;
  if (v6 == 7)
    v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", v7, a3);
  v8 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "auxiliaryOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setAuxiliaryOptions:", v9);

  return objc_msgSend(*(id *)(a1 + 32), "_endDelayingPresentation");
}

- (UIDocumentMenuViewController)initWithCoder:(NSCoder *)coder
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIDocumentMenuViewController;
  return -[UIViewController initWithCoder:](&v4, sel_initWithCoder_, coder);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIDocumentMenuViewController;
  -[UIViewController preferredContentSizeDidChangeForChildContentContainer:](&v4, sel_preferredContentSizeDidChangeForChildContentContainer_, a3);
  -[UIViewController preferredContentSize](self->_childViewController, "preferredContentSize");
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)addOptionWithTitle:(NSString *)title image:(UIImage *)image order:(UIDocumentMenuOrder)order handler:(void *)handler
{
  void *v10;
  UIImage *v11;
  NSString *v12;
  void *v13;
  _UIDocumentPickerAuxiliaryOption *v14;

  v10 = handler;
  v11 = image;
  v12 = title;
  v14 = objc_alloc_init(_UIDocumentPickerAuxiliaryOption);
  -[_UIDocumentPickerAuxiliaryOption setTitle:](v14, "setTitle:", v12);

  -[_UIDocumentPickerAuxiliaryOption setImage:](v14, "setImage:", v11);
  -[_UIDocumentPickerAuxiliaryOption setHandler:](v14, "setHandler:", v10);

  -[_UIDocumentPickerAuxiliaryOption setOrder:](v14, "setOrder:", order);
  -[UIDocumentMenuViewController auxiliaryOptions](self, "auxiliaryOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v14);

}

- (void)_setChildViewController:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  -[UIViewController view](self->_childViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[UIViewController removeFromParentViewController](self->_childViewController, "removeFromParentViewController");
  objc_storeStrong((id *)&self->_childViewController, a3);
  if (self->_childViewController)
  {
    objc_msgSend(v25, "willMoveToParentViewController:", self);
    -[UIViewController addChildViewController:](self, "addChildViewController:", v25);
    -[UIViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v7);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0D156E0];
    objc_msgSend(v25, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 7, 0, v11, 7, 1.0, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v12);

    v13 = (void *)MEMORY[0x1E0D156E0];
    objc_msgSend(v25, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 8, 0, v15, 8, 1.0, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v16);

    v17 = (void *)MEMORY[0x1E0D156E0];
    objc_msgSend(v25, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 1, 0, v19, 1, 1.0, 0.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v20);

    v21 = (void *)MEMORY[0x1E0D156E0];
    objc_msgSend(v25, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v22, 3, 0, v23, 3, 1.0, 0.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v24);

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v8);
    objc_msgSend(v25, "didMoveToParentViewController:", self);

  }
}

- (_UIDocumentPickerRemoteViewController)_remoteViewController
{
  return (_UIDocumentPickerRemoteViewController *)-[_UIResilientRemoteViewContainerViewController remoteViewController](self->_childViewController, "remoteViewController");
}

- (void)_setIsContentManaged:(BOOL)a3
{
  void *v4;
  id v5;

  self->_isContentManaged = a3;
  -[UIDocumentMenuViewController _remoteViewController](self, "_remoteViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceViewControllerProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setIsContentManaged:", self->_isContentManaged);

}

- (void)_didSelectPicker
{
  void *v3;
  _QWORD v4[5];

  -[UIViewController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__UIDocumentMenuViewController__didSelectPicker__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v4);

}

void __48__UIDocumentMenuViewController__didSelectPicker__block_invoke(uint64_t a1)
{
  unint64_t v2;
  UIDocumentPickerViewController *v3;
  void *v4;
  uint64_t v5;
  UIDocumentPickerViewController *v6;
  void *v7;
  id v8;

  v2 = objc_msgSend(*(id *)(a1 + 32), "documentPickerMode");
  if (v2 - 2 < 2)
  {
    v6 = [UIDocumentPickerViewController alloc];
    objc_msgSend(*(id *)(a1 + 32), "uploadURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[UIDocumentPickerViewController initWithURL:inMode:](v6, "initWithURL:inMode:", v4, objc_msgSend(*(id *)(a1 + 32), "documentPickerMode"));
  }
  else
  {
    if (v2 > 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v3 = [UIDocumentPickerViewController alloc];
    objc_msgSend(*(id *)(a1 + 32), "allowedUTIs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[UIDocumentPickerViewController initWithDocumentTypes:inMode:](v3, "initWithDocumentTypes:inMode:", v4, objc_msgSend(*(id *)(a1 + 32), "documentPickerMode"));
  }
  v8 = (id)v5;

LABEL_7:
  objc_msgSend(v8, "_setIsContentManaged:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 978));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentMenu:didPickDocumentPicker:", *(_QWORD *)(a1 + 32), v8);

  objc_msgSend(*(id *)(a1 + 32), "setDismissDelegateCalled:", 1);
}

- (void)_displayLocationsMenuFromRect:(CGRect)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentMenuViewController.m"), 274, CFSTR("1st party doc picker requested locations menu display"));

}

- (void)_dismissViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDocumentMenuViewController setAuxiliaryOptions:](self, "setAuxiliaryOptions:", v3);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[UIDocumentMenuViewController _remoteViewController](self, "_remoteViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[UIDocumentMenuViewController _childViewController](self, "_childViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  if (!-[UIDocumentMenuViewController dismissDelegateCalled](self, "dismissDelegateCalled"))
  {
    -[UIDocumentMenuViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UIDocumentMenuViewController setDismissDelegateCalled:](self, "setDismissDelegateCalled:", 1);
      objc_msgSend(v7, "documentMenuWasCancelled:", self);
    }

  }
}

- (void)_dismissWithOption:(id)a3
{
  id v5;
  NSMutableArray *auxiliaryOptions;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = a3;
  auxiliaryOptions = self->_auxiliaryOptions;
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __51__UIDocumentMenuViewController__dismissWithOption___block_invoke;
  v18[3] = &unk_1E16C3618;
  v8 = v5;
  v19 = v8;
  -[NSMutableArray objectAtIndex:](self->_auxiliaryOptions, "objectAtIndex:", -[NSMutableArray indexOfObjectPassingTest:](auxiliaryOptions, "indexOfObjectPassingTest:", v18));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentMenuViewController.m"), 304, CFSTR("Document picker menu dismissed with an option not previously specified?"));

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDocumentMenuViewController setAuxiliaryOptions:](self, "setAuxiliaryOptions:", v10);

  -[UIDocumentMenuViewController setDismissDelegateCalled:](self, "setDismissDelegateCalled:", 1);
  -[UIViewController presentingViewController](self, "presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentMenuViewController.m"), 308, CFSTR("%s: presenting view controller is nil"), "-[UIDocumentMenuViewController _dismissWithOption:]");

  }
  -[UIViewController presentingViewController](self, "presentingViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __51__UIDocumentMenuViewController__dismissWithOption___block_invoke_2;
  v16[3] = &unk_1E16B1B28;
  v17 = v9;
  v13 = v9;
  objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, v16);

}

uint64_t __51__UIDocumentMenuViewController__dismissWithOption___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __51__UIDocumentMenuViewController__dismissWithOption___block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "handler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIDocumentMenuViewController;
  -[UIViewController setModalPresentationStyle:](&v3, sel_setModalPresentationStyle_, 100);
}

- (BOOL)_ignoreApplicationEntitlementForImport
{
  return self->_ignoreApplicationEntitlementForImport;
}

- (void)_setIgnoreApplicationEntitlementForImport:(BOOL)a3
{
  self->_ignoreApplicationEntitlementForImport = a3;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (NSMutableArray)auxiliaryOptions
{
  return self->_auxiliaryOptions;
}

- (void)setAuxiliaryOptions:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryOptions, a3);
}

- (_UIResilientRemoteViewContainerViewController)_childViewController
{
  return self->_childViewController;
}

- (BOOL)dismissDelegateCalled
{
  return self->_dismissDelegateCalled;
}

- (void)setDismissDelegateCalled:(BOOL)a3
{
  self->_dismissDelegateCalled = a3;
}

- (unint64_t)documentPickerMode
{
  return self->_documentPickerMode;
}

- (void)setDocumentPickerMode:(unint64_t)a3
{
  self->_documentPickerMode = a3;
}

- (NSURL)uploadURL
{
  return self->_uploadURL;
}

- (void)setUploadURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (NSArray)allowedUTIs
{
  return self->_allowedUTIs;
}

- (void)setAllowedUTIs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (BOOL)_isContentManaged
{
  return self->_isContentManaged;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedUTIs, 0);
  objc_storeStrong((id *)&self->_uploadURL, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_weak_delegate, 0);
}

@end
