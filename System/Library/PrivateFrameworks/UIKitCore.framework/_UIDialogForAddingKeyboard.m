@implementation _UIDialogForAddingKeyboard

- (void)presentPrivacySheet
{
  UITextView *v3;
  void *v4;
  void *v5;
  void *v6;
  UIViewController *v7;
  void *v8;
  void *v9;
  UIBarButtonItem *v10;
  void *v11;
  UINavigationController *v12;
  UINavigationController *privacySheetController;
  void *v14;
  void *v15;
  UIWindow *v16;
  void *v17;
  UIWindow *v18;
  UIWindow *presenterWindow;
  UIViewController *v20;
  void *v21;
  UITextView *v22;

  v3 = [UITextView alloc];
  v22 = -[UITextView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  UIKeyboardSettingsBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ABOUT_APP_KEYBOARDS_INFO_TEXT"), &stru_1E16EDF20, CFSTR("Keyboard"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setText:](v22, "setText:", v5);

  objc_msgSend(off_1E167A828, "systemFontOfSize:", 14.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setFont:](v22, "setFont:", v6);

  -[UITextView setEditable:](v22, "setEditable:", 0);
  v7 = objc_alloc_init(UIViewController);
  UIKeyboardSettingsBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ABOUT_APP_KEYBOARDS_TITLE"), &stru_1E16EDF20, CFSTR("Keyboard"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController setTitle:](v7, "setTitle:", v9);

  -[UIViewController setView:](v7, "setView:", v22);
  v10 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismiss);
  -[UIViewController navigationItem](v7, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRightBarButtonItem:", v10);

  v12 = -[UINavigationController initWithRootViewController:]([UINavigationController alloc], "initWithRootViewController:", v7);
  privacySheetController = self->_privacySheetController;
  self->_privacySheetController = v12;

  -[UIViewController setModalPresentationStyle:](self->_privacySheetController, "setModalPresentationStyle:", 2);
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scene");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [UIWindow alloc];
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v18 = -[UIWindow initWithFrame:](v16, "initWithFrame:");
  presenterWindow = self->_presenterWindow;
  self->_presenterWindow = v18;

  -[UIWindow _setRoleHint:](self->_presenterWindow, "_setRoleHint:", CFSTR("_UIWindowRoleHintKeyboardPrivacySheet"));
  -[UIView setOpaque:](self->_presenterWindow, "setOpaque:", 0);
  -[UIWindow setWindowScene:](self->_presenterWindow, "setWindowScene:", v15);
  -[UIWindow setWindowLevel:](self->_presenterWindow, "setWindowLevel:", 2000.0);
  -[UIWindow setHidden:](self->_presenterWindow, "setHidden:", 1);
  -[UIWindow _setWindowControlsStatusBarOrientation:](self->_presenterWindow, "_setWindowControlsStatusBarOrientation:", 0);
  v20 = objc_alloc_init(UIViewController);
  -[UIWindow setRootViewController:](self->_presenterWindow, "setRootViewController:", v20);

  -[UIWindow makeKeyAndVisible](self->_presenterWindow, "makeKeyAndVisible");
  -[UIWindow rootViewController](self->_presenterWindow, "rootViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "presentViewController:animated:completion:", self->_privacySheetController, 1, 0);

}

- (void)dismiss
{
  UINavigationController *privacySheetController;
  _QWORD v3[5];

  privacySheetController = self->_privacySheetController;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37___UIDialogForAddingKeyboard_dismiss__block_invoke;
  v3[3] = &unk_1E16B1B28;
  v3[4] = self;
  -[UIViewController dismissViewControllerAnimated:completion:](privacySheetController, "dismissViewControllerAnimated:completion:", 1, v3);
}

- (void)presentDialogForAddingKeyboard
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __60___UIDialogForAddingKeyboard_presentDialogForAddingKeyboard__block_invoke;
  v2[3] = &unk_1E16B42D0;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DBDB40], "presentDialogForType:withCompletionHandler:", 1, v2);
}

+ (void)presentDialogForAddingKeyboard
{
  void *v2;
  _UIDialogForAddingKeyboard *v3;
  void *v4;

  v2 = (void *)presentDialogForAddingKeyboard___instance;
  if (!presentDialogForAddingKeyboard___instance)
  {
    v3 = objc_alloc_init(_UIDialogForAddingKeyboard);
    v4 = (void *)presentDialogForAddingKeyboard___instance;
    presentDialogForAddingKeyboard___instance = (uint64_t)v3;

    v2 = (void *)presentDialogForAddingKeyboard___instance;
  }
  objc_msgSend(v2, "presentDialogForAddingKeyboard");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacySheetController, 0);
  objc_storeStrong((id *)&self->_presenterWindow, 0);
}

@end
