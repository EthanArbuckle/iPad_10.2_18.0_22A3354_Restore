@implementation PUSurveyQuestionsWelcomeViewController

- (PUSurveyQuestionsWelcomeViewController)initWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PUSurveyQuestionsWelcomeViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  PXLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("Photos_GettingStarted"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)PUSurveyQuestionsWelcomeViewController;
  v8 = -[PUSurveyQuestionsWelcomeViewController initWithTitle:detailText:icon:](&v15, sel_initWithTitle_detailText_icon_, v5, v6, v7);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    PULocalizedString(CFSTR("WHATS_NEW_WELCOME_CONTINUE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:forState:", v10, 0);

    objc_msgSend(v9, "addTarget:action:forControlEvents:", v8, sel__handleContinueButton_, 0x2000);
    -[PUSurveyQuestionsWelcomeViewController buttonTray](v8, "buttonTray");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addButton:", v9);

    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel__handleContinueButton_);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSurveyQuestionsWelcomeViewController addKeyCommand:](v8, "addKeyCommand:", v12);

    -[PUSurveyQuestionsWelcomeViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 2);
    v13 = (void *)objc_msgSend(v4, "copy");
    -[PUSurveyQuestionsWelcomeViewController _setCompletionHandler:](v8, "_setCompletionHandler:", v13);

  }
  return v8;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v5;
  objc_super v6;
  _QWORD v7[4];
  PUSurveyQuestionsWelcomeViewController *v8;
  id v9;

  v4 = a3;
  v7[1] = 3221225472;
  v7[2] = __83__PUSurveyQuestionsWelcomeViewController_dismissViewControllerAnimated_completion___block_invoke;
  v7[3] = &unk_1E58AB968;
  v8 = self;
  v9 = a4;
  v6.receiver = v8;
  v6.super_class = (Class)PUSurveyQuestionsWelcomeViewController;
  v7[0] = MEMORY[0x1E0C809B0];
  v5 = v9;
  -[PUSurveyQuestionsWelcomeViewController dismissViewControllerAnimated:completion:](&v6, sel_dismissViewControllerAnimated_completion_, v4, v7);

}

- (void)_handleContinueButton:(id)a3
{
  -[PUSurveyQuestionsWelcomeViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
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

void __83__PUSurveyQuestionsWelcomeViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInteger:forKey:", 1, CFSTR("LastSurveyQuestionsWelcomeShown"));

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
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_get_global_queue(21, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __117__PUSurveyQuestionsWelcomeViewController_presentIfNecessaryFromViewController_presentationHandler_completionHandler___block_invoke;
  block[3] = &unk_1E58AB800;
  v15 = v7;
  v16 = v9;
  v17 = v8;
  v11 = v8;
  v12 = v7;
  v13 = v9;
  dispatch_async(v10, block);

}

+ (void)resetLastPresentationInfo
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("LastSurveyQuestionsWelcomeShown"));

}

void __117__PUSurveyQuestionsWelcomeViewController_presentIfNecessaryFromViewController_presentationHandler_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setShouldPrefetchCount:", 1);
  objc_msgSend(MEMORY[0x1E0CD1720], "fetchUnansweredQuestionsWithOptions:validQuestionsOnly:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5
    && (objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "integerForKey:", CFSTR("LastSurveyQuestionsWelcomeShown")),
        v6,
        v7 <= 0))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __117__PUSurveyQuestionsWelcomeViewController_presentIfNecessaryFromViewController_presentationHandler_completionHandler___block_invoke_2;
    block[3] = &unk_1E58AB800;
    v10 = a1[5];
    v9 = a1[4];
    v11 = a1[6];
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }

}

void __117__PUSurveyQuestionsWelcomeViewController_presentIfNecessaryFromViewController_presentationHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  PUSurveyQuestionsWelcomeViewController *v2;

  v2 = -[PUSurveyQuestionsWelcomeViewController initWithCompletionHandler:]([PUSurveyQuestionsWelcomeViewController alloc], "initWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v2, 1, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
