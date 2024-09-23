@implementation PXSurveyQuestionsHorizontalGadget

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXSurveyQuestionsHorizontalGadget;
  -[PXGadgetUIViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[PXSurveyQuestionsHorizontalGadget nextViewLayoutExpectation](self, "nextViewLayoutExpectation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fulfill");

  -[PXSurveyQuestionsHorizontalGadget setNextViewLayoutExpectation:](self, "setNextViewLayoutExpectation:", 0);
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[PXSurveyQuestionsHorizontalGadget parentViewController](self, "parentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v14.receiver = self;
    v14.super_class = (Class)PXSurveyQuestionsHorizontalGadget;
    -[PXSurveyQuestionsHorizontalGadget presentViewController:animated:completion:](&v14, sel_presentViewController_animated_completion_, v8, v6, v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_firstKeyWindow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rootViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "presentViewController:animated:completion:", v8, v6, v9);
  }

}

- (unint64_t)headerStyle
{
  return 6;
}

- (unint64_t)accessoryButtonType
{
  return 1;
}

- (id)accessoryButtonTitle
{
  return PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeHide"), CFSTR("PhotosUICore"));
}

- (BOOL)selectionFollowsFocus
{
  return 1;
}

- (id)accessoryButtonAction
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__PXSurveyQuestionsHorizontalGadget_accessoryButtonAction__block_invoke;
  aBlock[3] = &unk_1E5136B60;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

- (id)alertControllerForHideAction
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  char IsAppleInternal;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  PXSurveyQuestionsHorizontalGadget *v30;
  char v31;
  _QWORD v32[4];
  id v33;
  PXSurveyQuestionsHorizontalGadget *v34;
  _QWORD v35[4];
  id v36;
  PXSurveyQuestionsHorizontalGadget *v37;
  _QWORD v38[4];
  id v39;

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeHideCancel"), CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke;
  v38[3] = &unk_1E5144530;
  v7 = v3;
  v39 = v7;
  objc_msgSend(v4, "actionWithTitle:style:handler:", v5, 1, v38);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeHideForToday"), CFSTR("PhotosUICore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v6;
  v35[1] = 3221225472;
  v35[2] = __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_2;
  v35[3] = &unk_1E51458F8;
  v10 = v7;
  v36 = v10;
  v37 = self;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, v35);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeHideForAWeek"), CFSTR("PhotosUICore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v6;
  v32[1] = 3221225472;
  v32[2] = __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_4;
  v32[3] = &unk_1E51458F8;
  v14 = v10;
  v33 = v14;
  v34 = self;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, v32);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  IsAppleInternal = PXSurveyQuestionIsAppleInternal();
  if ((IsAppleInternal & 1) != 0)
  {
    -[PXHorizontalCollectionGadget horizontalGadgetDelegate](self, "horizontalGadgetDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hideForeverAlertMessageForHorizontalCollectionGadget:", self);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeHideForeverActionMessageProfile"), CFSTR("PhotosUICore"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeHideForever"), CFSTR("PhotosUICore"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v6;
  v27[1] = 3221225472;
  v27[2] = __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_6;
  v27[3] = &unk_1E5136B88;
  v21 = v14;
  v28 = v21;
  v29 = v18;
  v31 = IsAppleInternal;
  v30 = self;
  v22 = v18;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 2, v27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "addAction:", v26);
  objc_msgSend(v21, "addAction:", v11);
  objc_msgSend(v21, "addAction:", v15);
  objc_msgSend(v21, "addAction:", v23);
  v24 = v21;

  return v24;
}

- (void)_hideAccessoryButtonAction
{
  id v3;

  -[PXSurveyQuestionsHorizontalGadget alertControllerForHideAction](self, "alertControllerForHideAction");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSurveyQuestionsHorizontalGadget presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

- (id)alertControllerForInfoAction
{
  char IsAppleInternal;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v22;
  _QWORD v23[4];
  id v24;
  PXSurveyQuestionsHorizontalGadget *v25;
  char v26;
  _QWORD v27[4];
  id v28;

  IsAppleInternal = PXSurveyQuestionIsAppleInternal();
  -[PXHorizontalCollectionGadget horizontalGadgetDelegate](self, "horizontalGadgetDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "infoAlertTitleForHorizontalCollectionGadget:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((IsAppleInternal & 1) != 0)
  {
    -[PXHorizontalCollectionGadget horizontalGadgetDelegate](self, "horizontalGadgetDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "infoAlertMessageForHorizontalCollectionGadget:", self);
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = CFSTR("PXInternalPhotosChallengeInfoDonateDataButton");
  }
  else
  {
    PXLocalizedStringFromTable(CFSTR("SURVEY_QUESTIONS_PHOTOS_WELCOME_BODY_PROFILE"), CFSTR("PhotosUICore"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("PXInternalPhotosChallengeInfoRequestConsentFormButton");
  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v5, v7, 0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeInfoCloseButton"), CFSTR("PhotosUICore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __65__PXSurveyQuestionsHorizontalGadget_alertControllerForInfoAction__block_invoke;
  v27[3] = &unk_1E5144530;
  v13 = v9;
  v28 = v13;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 1, v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addAction:", v14);
  PXLocalizedStringFromTable(v8, CFSTR("PhotosUICore"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0DC3448];
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __65__PXSurveyQuestionsHorizontalGadget_alertControllerForInfoAction__block_invoke_2;
  v23[3] = &unk_1E5136BB0;
  v17 = v13;
  v26 = IsAppleInternal;
  v24 = v17;
  v25 = self;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v15, 0, v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAction:", v18);
  -[PXHorizontalCollectionGadget horizontalGadgetDelegate](self, "horizontalGadgetDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "horizontalCollectionGadget:configureCustomInfoAlertActionsForAlertController:", self, v17);

  v20 = v17;
  return v20;
}

- (void)_infoAccessoryButtonAction
{
  id v3;

  -[PXSurveyQuestionsHorizontalGadget alertControllerForInfoAction](self, "alertControllerForInfoAction");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSurveyQuestionsHorizontalGadget presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

- (void)_hideSurveyQuestionsUntilDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXHorizontalCollectionGadget horizontalGadgetDelegate](self, "horizontalGadgetDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "horizontalCollectionGadget:hideUntilDate:", self, v4);

}

- (void)_sendRequestConsentFormMail
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  if (objc_msgSend(getMFMailComposeViewControllerClass_211302(), "canSendMail"))
  {
    v5 = objc_alloc_init((Class)getMFMailComposeViewControllerClass_211302());
    objc_msgSend(v5, "setMailComposeDelegate:", self);
    objc_msgSend(v5, "setSubject:", CFSTR("Photos Challenge Informed Consent Agreement Request"));
    objc_msgSend(v5, "setToRecipients:", &unk_1E53EA2D8);
    objc_msgSend(v5, "setMessageBody:isHTML:", CFSTR("Photos Challenge Informed Consent Agreement Request"), 0);
    -[PXSurveyQuestionsHorizontalGadget presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Unable to create email"), CFSTR("You need to set up an account in Mail in order submit your request to obtain your agreed to informed consent form."), 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __64__PXSurveyQuestionsHorizontalGadget__sendRequestConsentFormMail__block_invoke;
    v6[3] = &unk_1E5144530;
    v6[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 1, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addAction:", v4);
    -[PXSurveyQuestionsHorizontalGadget presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

  }
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  -[PXSurveyQuestionsHorizontalGadget dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0, a5);
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  return 1;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  PXSurveyRadarReporterViewController *v11;
  id v12;
  PXSurveyRadarReporterViewController *v13;
  id v14;
  id v15[5];
  id v16;
  _QWORD *v17;
  id v18;
  id location;
  _QWORD v20[3];
  char v21;

  v7 = a3;
  v8 = a5;
  -[PXHorizontalCollectionGadget horizontalGadgetDelegate](self, "horizontalGadgetDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "radarConfigurationForHorizontalCollectionGadget:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[PXSurveyRadarReporterViewController initWithConfiguration:completionHandler:]([PXSurveyRadarReporterViewController alloc], "initWithConfiguration:completionHandler:", v10, 0);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  objc_initWeak(&location, self);
  v15[1] = (id)MEMORY[0x1E0C809B0];
  v15[2] = (id)3221225472;
  v15[3] = __85__PXSurveyQuestionsHorizontalGadget_navigateToDestination_options_completionHandler___block_invoke;
  v15[4] = &unk_1E5137688;
  objc_copyWeak(&v18, &location);
  v17 = v20;
  v12 = v7;
  v16 = v12;
  v14 = v8;
  objc_copyWeak(v15, &location);
  v13 = v11;
  PXIterateAsynchronously();

  objc_destroyWeak(v15);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  _Block_object_dispose(v20, 8);

}

- (void)_checkCanNavigate:(BOOL *)a3 toDestination:(id)a4 iterator:(id)a5
{
  id v7;
  _BOOL4 v8;
  PXExpectation *v9;
  _QWORD v10[4];
  id v11;

  v7 = a5;
  v8 = -[UIViewController px_isVisible](self, "px_isVisible");
  *a3 = v8;
  if (v8)
  {
    objc_msgSend(v7, "stop");
  }
  else
  {
    v9 = -[PXExpectation initWithLabelFormat:]([PXExpectation alloc], "initWithLabelFormat:", CFSTR("%@'s next view layout"), self);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __78__PXSurveyQuestionsHorizontalGadget__checkCanNavigate_toDestination_iterator___block_invoke;
    v10[3] = &unk_1E5148B78;
    v11 = v7;
    -[PXExpectation performWhenFulfilled:timeout:](v9, "performWhenFulfilled:timeout:", v10, 3.0);
    -[PXSurveyQuestionsHorizontalGadget setNextViewLayoutExpectation:](self, "setNextViewLayoutExpectation:", v9);

  }
}

- (PXProgrammaticNavigationDestination)px_navigationDestination
{
  return 0;
}

- (id)nextExistingParticipantOnRouteToDestination:(id)a3
{
  return 0;
}

- (PXExpectation)nextViewLayoutExpectation
{
  return self->_nextViewLayoutExpectation;
}

- (void)setNextViewLayoutExpectation:(id)a3
{
  objc_storeStrong((id *)&self->_nextViewLayoutExpectation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextViewLayoutExpectation, 0);
}

uint64_t __78__PXSurveyQuestionsHorizontalGadget__checkCanNavigate_toDestination_iterator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "next");
}

void __85__PXSurveyQuestionsHorizontalGadget_navigateToDestination_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_checkCanNavigate:toDestination:iterator:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24, *(_QWORD *)(a1 + 32), v4);

}

uint64_t __85__PXSurveyQuestionsHorizontalGadget_navigateToDestination_options_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __64__PXSurveyQuestionsHorizontalGadget__sendRequestConsentFormMail__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __65__PXSurveyQuestionsHorizontalGadget_alertControllerForInfoAction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __65__PXSurveyQuestionsHorizontalGadget_alertControllerForInfoAction__block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];
  char v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__PXSurveyQuestionsHorizontalGadget_alertControllerForInfoAction__block_invoke_3;
  v3[3] = &unk_1E5144398;
  v4 = *(_BYTE *)(a1 + 48);
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, v3);
}

void __65__PXSurveyQuestionsHorizontalGadget_alertControllerForInfoAction__block_invoke_3(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  PXSurveyRadarReporterViewController *v5;
  id v6;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "horizontalGadgetDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "radarConfigurationForHorizontalCollectionGadget:", *(_QWORD *)(a1 + 32));
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v5 = -[PXSurveyRadarReporterViewController initWithConfiguration:completionHandler:]([PXSurveyRadarReporterViewController alloc], "initWithConfiguration:completionHandler:", v6, 0);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v5, 1, 0);

  }
  else
  {
    objc_msgSend(v3, "_sendRequestConsentFormMail");
  }
}

uint64_t __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_3;
  v3[3] = &unk_1E5149198;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, v3);
}

uint64_t __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_4(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_5;
  v3[3] = &unk_1E5149198;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, v3);
}

void __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_6(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  char v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_7;
  v5[3] = &unk_1E51473C0;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v8 = *(_BYTE *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v5);

}

void __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v2 = (void *)MEMORY[0x1E0DC3450];
  PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeHideForeverActionTitle"), CFSTR("PhotosUICore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertControllerWithTitle:message:preferredStyle:", v3, *(_QWORD *)(a1 + 32), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeHideCancel"), CFSTR("PhotosUICore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionWithTitle:style:handler:", v6, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v7);

  if (*(_BYTE *)(a1 + 48))
  {
    v8 = (void *)MEMORY[0x1E0DC3448];
    PXLocalizedStringFromTable(CFSTR("PXInternalPhotosChallengeHideForever"), CFSTR("PhotosUICore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_8;
    v11[3] = &unk_1E5144530;
    v11[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAction:", v10);

  }
  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v4, 1, 0);

}

void __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_8(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_hideSurveyQuestionsUntilDate:", v2);

}

void __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 0x2000, 1, v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "startOfDayForDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_hideSurveyQuestionsUntilDate:", v4);

}

void __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, 1, v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "startOfDayForDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_hideSurveyQuestionsUntilDate:", v4);

}

void __58__PXSurveyQuestionsHorizontalGadget_accessoryButtonAction__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[NSObject tag](v5, "tag");
    if (v6)
    {
      v7 = (const char *)v6;
      if (v6 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "_infoAccessoryButtonAction");
      }
      else
      {
        PLUIGetLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = 134218242;
          v10 = v7;
          v11 = 2080;
          v12 = "-[PXSurveyQuestionsHorizontalGadget accessoryButtonAction]_block_invoke";
          _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Unrecognized sender tag '%ld' in %s", (uint8_t *)&v9, 0x16u);
        }

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_hideAccessoryButtonAction");
    }
  }
  else
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "-[PXSurveyQuestionsHorizontalGadget accessoryButtonAction]_block_invoke";
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Unexpectedly failed to cast PXView to UIView in %s", (uint8_t *)&v9, 0xCu);
    }
  }

}

@end
