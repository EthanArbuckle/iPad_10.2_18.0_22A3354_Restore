@implementation PUWhatsNewWelcomeViewController

- (PUWhatsNewWelcomeViewController)initWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  PUWhatsNewWelcomeViewController *v6;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v4 = a3;
  PULocalizedString(CFSTR("WHATS_NEW_WELCOME_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)PUWhatsNewWelcomeViewController;
  v6 = -[PUWhatsNewWelcomeViewController initWithTitle:detailText:icon:](&v26, sel_initWithTitle_detailText_icon_, v5, 0, 0);

  if (v6)
  {
    PULocalizedString(CFSTR("WHATS_NEW_DESIGN_TITLE"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedString(CFSTR("WHATS_NEW_DESIGN_CONTENT"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("apple.photos"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithRenderingMode:", 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUWhatsNewWelcomeViewController addBulletedListItemWithTitle:description:image:](v6, "addBulletedListItemWithTitle:description:image:", v25, v24, v23);
    PULocalizedString(CFSTR("WHATS_NEW_COLLECTIONS_TITLE"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedString(CFSTR("WHATS_NEW_COLLECTIONS_CONTENT"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("person.2.crop.square.stack"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageWithRenderingMode:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUWhatsNewWelcomeViewController addBulletedListItemWithTitle:description:image:](v6, "addBulletedListItemWithTitle:description:image:", v22, v8, v10);
    PULocalizedString(CFSTR("WHATS_NEW_REORDER_CUSTOMIZABLE_TITLE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedString(CFSTR("WHATS_NEW_REORDER_CUSTOMIZABLE_CONTENT"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("arrow.trianglehead.swap"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageWithRenderingMode:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUWhatsNewWelcomeViewController addBulletedListItemWithTitle:description:image:](v6, "addBulletedListItemWithTitle:description:image:", v11, v12, v14);
    objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    PULocalizedString(CFSTR("WHATS_NEW_WELCOME_CONTINUE"));
    v16 = v4;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitle:forState:", v17, 0);

    objc_msgSend(v15, "addTarget:action:forControlEvents:", v6, sel__handleContinueButton_, 0x2000);
    -[PUWhatsNewWelcomeViewController buttonTray](v6, "buttonTray");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addButton:", v15);

    v4 = v16;
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel__handleContinueButton_);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWhatsNewWelcomeViewController addKeyCommand:](v6, "addKeyCommand:", v19);

    -[PUWhatsNewWelcomeViewController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 2);
    -[PUWhatsNewWelcomeViewController setModalInPresentation:](v6, "setModalInPresentation:", 1);
    v20 = (void *)objc_msgSend(v16, "copy");
    -[PUWhatsNewWelcomeViewController _setCompletionHandler:](v6, "_setCompletionHandler:", v20);

  }
  return v6;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v5;
  objc_super v6;
  _QWORD v7[4];
  PUWhatsNewWelcomeViewController *v8;
  id v9;

  v4 = a3;
  v7[1] = 3221225472;
  v7[2] = __76__PUWhatsNewWelcomeViewController_dismissViewControllerAnimated_completion___block_invoke;
  v7[3] = &unk_1E58AB968;
  v8 = self;
  v9 = a4;
  v6.receiver = v8;
  v6.super_class = (Class)PUWhatsNewWelcomeViewController;
  v7[0] = MEMORY[0x1E0C809B0];
  v5 = v9;
  -[PUWhatsNewWelcomeViewController dismissViewControllerAnimated:completion:](&v6, sel_dismissViewControllerAnimated_completion_, v4, v7);

}

- (void)_handleContinueButton:(id)a3
{
  -[PUWhatsNewWelcomeViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)_completionHandler
{
  return self->__completionHandler;
}

- (void)_setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1176);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__completionHandler, 0);
}

void __76__PUWhatsNewWelcomeViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInteger:forKey:", 11, CFSTR("LastWhatsNewShown"));

  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_completionHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, 1);

    objc_msgSend(*(id *)(a1 + 32), "_setCompletionHandler:", 0);
  }
}

+ (void)presentIfNecessaryFromViewController:(id)a3 presentationHandler:(id)a4 completionHandler:(id)a5
{
  void (**v7)(_QWORD);
  void (**v8)(id, _QWORD);
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  PUWhatsNewWelcomeViewController *v14;
  id v15;

  v15 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = (void (**)(id, _QWORD))a5;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerForKey:", CFSTR("LastWhatsNewShown"));

  +[PUWelcomeSettings sharedInstance](PUWelcomeSettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "whatsNewBehavior");

  if (!v12 || (v12 != 1 ? (v13 = v10 <= 10) : (v13 = 0), v13))
  {
    v14 = -[PUWhatsNewWelcomeViewController initWithCompletionHandler:]([PUWhatsNewWelcomeViewController alloc], "initWithCompletionHandler:", v8);
    objc_msgSend(v15, "presentViewController:animated:completion:", v14, 1, 0);
    v7[2](v7);

  }
  else
  {
    v8[2](v8, 0);
  }

}

+ (void)resetLastPresentationInfo
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("LastWhatsNewShown"));

}

@end
