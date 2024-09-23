@implementation VUIAppNavigationController

- (void)_presentConfirmationViewController:(id)a3 preferredContentSize:(CGSize)a4 completion:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  VUIConfirmationDocumentWrapperViewController *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  height = a4.height;
  width = a4.width;
  v9 = a5;
  v10 = a3;
  v11 = objc_alloc_init(VUIConfirmationDocumentWrapperViewController);
  -[VUIConfirmationDocumentWrapperViewController vuiView](v11, "vuiView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppNavigationController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  objc_msgSend(v12, "setFrame:");

  if (*MEMORY[0x1E0C9D820] != width || *(double *)(MEMORY[0x1E0C9D820] + 8) != height)
    -[VUIConfirmationDocumentWrapperViewController setPreferredContentSize:](v11, "setPreferredContentSize:", width, height);
  -[VUIConfirmationDocumentWrapperViewController vui_addChildViewController:](v11, "vui_addChildViewController:", v10);
  objc_msgSend(v10, "vui_didMoveToParentViewController:", v11);
  -[VUIConfirmationDocumentWrapperViewController vuiView](v11, "vuiView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "vuiView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "vui_addSubview:oldView:", v16, 0);
  -[VUIConfirmationDocumentWrapperViewController setVuiModalPresentationStyle:](v11, "setVuiModalPresentationStyle:", 6);
  +[VUIConfirmationTransitioningDelegate sharedInstance](VUIConfirmationTransitioningDelegate, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIConfirmationDocumentWrapperViewController setTransitioningDelegate:](v11, "setTransitioningDelegate:", v17);

  +[VUIConfirmationTransitioningDelegate sharedInstance](VUIConfirmationTransitioningDelegate, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __97__VUIAppNavigationController__presentConfirmationViewController_preferredContentSize_completion___block_invoke;
  v20[3] = &unk_1E9F98E68;
  v21 = v9;
  v19 = v9;
  objc_msgSend(v18, "setDismissedHandlerBlock:", v20);

  -[UIViewController vui_presentViewController:animated:completion:](self, "vui_presentViewController:animated:completion:", v11, 1, 0);
}

uint64_t __97__VUIAppNavigationController__presentConfirmationViewController_preferredContentSize_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)presentConfirmationDialogWithType:(id)a3 name:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  VUIDocumentDataSource *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "appContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setConfirmationDialogType:", v19);
  if (v8)
    objc_msgSend(v13, "setName:", v8);
  v14 = -[VUIDocumentDataSource initWithDocumentRef:]([VUIDocumentDataSource alloc], "initWithDocumentRef:", CFSTR("ConfirmationDialog"));
  -[VUIDocumentDataSource setDocumentType:](v14, "setDocumentType:", CFSTR("default"));
  -[VUIDocumentDataSource setControllerRef:](v14, "setControllerRef:", CFSTR("ConfirmationDialog"));
  -[VUIDocumentDataSource setContextData:](v14, "setContextData:", v13);
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "viewControllerWithDocumentDataSource:appContext:", v14, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)dialogAccessibilityIdentifierPrefix, "stringByAppendingString:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "vuiView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setVuiAccessibilityIdentifier:", v17);

  -[VUIAppNavigationController _presentConfirmationViewController:preferredContentSize:completion:](self, "_presentConfirmationViewController:preferredContentSize:completion:", v16, v9, 200.0, 200.0);
}

- (void)presentConfirmationDialogWithType:(id)a3 name:(id)a4
{
  -[VUIAppNavigationController presentConfirmationDialogWithType:name:completion:](self, "presentConfirmationDialogWithType:name:completion:", a3, a4, 0);
}

- (void)presentConfirmationDialogWithType:(id)a3
{
  -[VUIAppNavigationController presentConfirmationDialogWithType:name:](self, "presentConfirmationDialogWithType:name:", a3, 0);
}

@end
