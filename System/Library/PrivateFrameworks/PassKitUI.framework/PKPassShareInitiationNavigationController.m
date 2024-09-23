@implementation PKPassShareInitiationNavigationController

- (PKPassShareInitiationNavigationController)initWithSharesController:(id)a3 environment:(unint64_t)a4
{
  id v7;
  PKPassShareInitiationNavigationController *v8;
  PKPassShareInitiationNavigationController *v9;
  id *p_sharesController;
  void *v11;
  PKShareInitiationAnalyticsReporter *v12;
  PKShareInitiationAnalyticsReporter *analyticsReporter;
  PKPassShareInitiationContext *v14;
  void *v15;
  uint64_t v16;
  PKPassShareInitiationContext *context;
  PKPassShareInitiationContext *v18;
  void *v19;
  PKPassShareInitiationContext *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  PKPassShareInitiationContext *v29;
  void *v30;
  PKPassShareInitiationContext *v31;
  void *v32;
  PKPassShareInitiationContext *v33;
  void *v34;
  PKPassShareInitiationContext *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_super v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v40.receiver = self;
  v40.super_class = (Class)PKPassShareInitiationNavigationController;
  v8 = -[PKNavigationController init](&v40, sel_init);
  v9 = v8;
  if (v8)
  {
    p_sharesController = (id *)&v8->_sharesController;
    objc_storeStrong((id *)&v8->_sharesController, a3);
    objc_msgSend(*p_sharesController, "prewarmCreateShare");
    objc_msgSend(*p_sharesController, "pass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PKShareInitiationAnalyticsReporter initWithPass:]([PKShareInitiationAnalyticsReporter alloc], "initWithPass:", v11);
    analyticsReporter = v9->_analyticsReporter;
    v9->_analyticsReporter = v12;

    v14 = [PKPassShareInitiationContext alloc];
    objc_msgSend(*p_sharesController, "baseNewShareForPass");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PKPassShareInitiationContext initWithFlow:share:](v14, "initWithFlow:share:", 0, v15);
    context = v9->_context;
    v9->_context = (PKPassShareInitiationContext *)v16;

    -[PKPassShareInitiationContext setAuthenticationType:](v9->_context, "setAuthenticationType:", objc_msgSend(v11, "isCarKeyPass"));
    -[PKPassShareInitiationContext setEnvironment:](v9->_context, "setEnvironment:", a4);
    v18 = v9->_context;
    objc_msgSend(*p_sharesController, "blockedSharingChannels");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassShareInitiationContext setBlockedChannels:](v18, "setBlockedChannels:", v19);

    v20 = v9->_context;
    objc_msgSend(*p_sharesController, "allowedSharingChannels");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassShareInitiationContext setAllowedChannels:](v20, "setAllowedChannels:", v21);

    -[PKPassShareInitiationContext allowedChannels](v9->_context, "allowedChannels");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x1E0D96DC0];
    v41[0] = *MEMORY[0x1E0D96DC0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = PKEqualObjects();

    if (v25)
    {
      -[PKPassShareInitiationContext setChannelBundleIdentifier:](v9->_context, "setChannelBundleIdentifier:", v23);
      -[PKPassShareInitiationContext setFlow:](v9->_context, "setFlow:", 6);
    }
    v26 = (void *)MEMORY[0x1E0D676A0];
    objc_msgSend(*p_sharesController, "pass");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "displayInformationForAccessPass:webService:", v27, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v9->_context;
    objc_msgSend(v28, "title");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassShareInitiationContext setSharePreviewTitle:](v29, "setSharePreviewTitle:", v30);

    v31 = v9->_context;
    objc_msgSend(v28, "subtitle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassShareInitiationContext setSharePreviewSubtitle:](v31, "setSharePreviewSubtitle:", v32);

    v33 = v9->_context;
    objc_msgSend(v28, "imageURL");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassShareInitiationContext setSharePreviewImageURL:](v33, "setSharePreviewImageURL:", v34);

    v35 = v9->_context;
    v36 = (void *)MEMORY[0x1E0DC3870];
    PKPassKitUIBundle();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "imageNamed:inBundle:", CFSTR("Generic-Shared-Key"), v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassShareInitiationContext setSharePreviewFallbackImage:](v35, "setSharePreviewFallbackImage:", v38);

  }
  return v9;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPassShareInitiationNavigationController;
  -[PKPassShareInitiationNavigationController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  if (!self->_hasAppeared)
  {
    self->_hasAppeared = 1;
    if ((-[PKSharedPassSharesController isCrossPlatformSharingEnabled](self->_sharesController, "isCrossPlatformSharingEnabled") & 1) == 0)
    {
      -[PKSharedPassSharesController pass](self->_sharesController, "pass");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isCarKeyPass");

      if (!v5)
      {
        -[PKPassShareInitiationNavigationController setNavigationBarHidden:](self, "setNavigationBarHidden:", 1);
        objc_msgSend(MEMORY[0x1E0CB35C8], "pkSharingError:", 7);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPassShareInitiationNavigationController _flowDidCancelWithError:](self, "_flowDidCancelWithError:", v7);

        return;
      }
      -[PKPassShareInitiationContext setFlow:](self->_context, "setFlow:", 5);
    }
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Starting share initiation flow", v8, 2u);
    }

    -[PKPassShareInitiationNavigationController _transitionToNextStep](self, "_transitionToNextStep");
  }
}

- (BOOL)shouldPromptUserToShare
{
  return -[PKPassShareInitiationContext flow](self->_context, "flow") != 4;
}

- (void)setShouldPromptUserToShare:(BOOL)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (!a3)
  {
    if (-[PKPassShareInitiationContext flow](self->_context, "flow") == 5)
    {
      PKLogFacilityTypeGetObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "ShareInitiation: ignore setShouldPromptUserToShare because using legacy flow", v5, 2u);
      }

    }
    else
    {
      -[PKPassShareInitiationContext setFlow:](self->_context, "setFlow:", 4);
    }
  }
}

- (void)_transitionToNextStep
{
  -[PKPassShareInitiationNavigationController _transitionToNextStepIsMockTransition:](self, "_transitionToNextStepIsMockTransition:", 0);
}

- (unint64_t)_transitionToNextStepIsMockTransition:(BOOL)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  unint64_t currentStep;
  int v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = -[PKPassShareInitiationContext flow](self->_context, "flow");
  v6 = v5;
  switch(self->_currentStep)
  {
    case 0uLL:
      if (-[PKPassShareInitiationContext environment](self->_context, "environment") != 2)
      {
        v9 = 0;
        v8 = 0;
        v12 = v6 - 5 >= 2;
        goto LABEL_20;
      }
      v9 = 0;
      v8 = 0;
      v7 = 1;
      if (!a3)
        goto LABEL_24;
      break;
    case 1uLL:
      v9 = 0;
      v8 = 0;
      v12 = v5 - 4 >= 3;
LABEL_20:
      if (v12)
        v7 = 2;
      else
        v7 = 3;
      if (!a3)
        goto LABEL_24;
      break;
    case 2uLL:
      v9 = 0;
      v8 = 0;
      v7 = 3;
      if (!a3)
        goto LABEL_24;
      break;
    case 3uLL:
      v9 = 0;
      v8 = 0;
      v7 = 4;
      if (!a3)
        goto LABEL_24;
      break;
    case 4uLL:
      -[PKPassShareInitiationContext composedShare](self->_context, "composedShare");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "activationOptions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v11 == 0;
      if (v11)
        v7 = 5;
      else
        v7 = 0;
      v8 = v11 == 0;
      if (!a3)
        goto LABEL_24;
      break;
    case 5uLL:
    case 6uLL:
      v7 = 0;
      if (!a3)
        goto LABEL_25;
      break;
    default:
      v7 = 0;
      v8 = 0;
      v9 = 1;
      if (!a3)
      {
LABEL_24:
        if (v8)
        {
LABEL_25:
          -[PKPassShareInitiationNavigationController _flowDidFinishWithSuccess](self, "_flowDidFinishWithSuccess");
        }
        else if (v9)
        {
          PKLogFacilityTypeGetObject();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            currentStep = self->_currentStep;
            v16 = 134217984;
            v17 = currentStep;
            _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "ShareInitiation: WARNING: Unablet to determine next step from currentStep: %lu", (uint8_t *)&v16, 0xCu);
          }

        }
        else
        {
          -[PKPassShareInitiationNavigationController _transitionToStep:](self, "_transitionToStep:", v7);
        }
      }
      break;
  }
  return v7;
}

- (void)_transitionToStep:(unint64_t)a3
{
  NSObject *v5;
  const __CFString *v6;
  unint64_t currentStep;
  void *v8;
  uint64_t v9;
  PKPassShareIntroductionExplanationViewController *v10;
  int v11;
  PKInterceptableActivityViewController *v12;
  void *v13;
  void *v14;
  PKInterceptableActivityViewController *v15;
  PKInterceptableActivityViewController *activityViewController;
  PKInterceptableActivityViewController *v17;
  void *v18;
  PKInterceptableActivityViewController *v19;
  void *v20;
  void **v21;
  PKPassSharePreviewViewController *v22;
  PKPassSharePreviewViewController *previewViewController;
  char v24;
  unint64_t v25;
  PKInterceptableActivityViewController *v26;
  void *v27;
  void *v28;
  PKInterceptableActivityViewController *v29;
  PKInterceptableActivityViewController *v30;
  PKInterceptableActivityViewController *v31;
  void *v32;
  void *v33;
  PKShareInitiationAnalyticsReporter *analyticsReporter;
  void *v35;
  id v36;
  void *v37;
  PKPassShareInitiationNavigationController *v38;
  char v39;
  PKInterceptableActivityViewController *v40;
  PKInterceptableActivityViewController *v41;
  PKInterceptableActivityViewController *v42;
  PKPassShareInitiationNavigationController *v43;
  void *v44;
  PKPassShareInitiationNavigationController *v45;
  PKPassShareIntroductionExplanationViewController *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint8_t buf[4];
  const __CFString *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 > 6)
      v6 = CFSTR("unknown");
    else
      v6 = off_1E3E77DB8[a3];
    *(_DWORD *)buf = 138412290;
    v52 = v6;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Transitioning to step: %@", buf, 0xCu);
  }

  currentStep = self->_currentStep;
  self->_currentStep = a3;
  if (currentStep <= a3)
  {
    -[PKPassShareInitiationNavigationController viewControllers](self, "viewControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    switch(a3)
    {
      case 1uLL:
        v10 = -[PKPassShareIntroductionExplanationViewController initWithSharesController:context:delegate:]([PKPassShareIntroductionExplanationViewController alloc], "initWithSharesController:context:delegate:", self->_sharesController, self->_context, self);
        -[PKShareInitiationAnalyticsReporter sendEventForPage:specifics:](self->_analyticsReporter, "sendEventForPage:specifics:", 0, 0);
        v11 = 1;
        goto LABEL_12;
      case 2uLL:
        v12 = [PKInterceptableActivityViewController alloc];
        -[PKPassShareInitiationNavigationController _placeholderActivityItem](self, "_placeholderActivityItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[PKInterceptableActivityViewController initWithItems:peopleSuggestionBundleIds:delegate:](v12, "initWithItems:peopleSuggestionBundleIds:delegate:", v14, &unk_1E3FAE998, self);
        activityViewController = self->_activityViewController;
        self->_activityViewController = v15;

        v17 = self->_activityViewController;
        -[PKPassShareInitiationContext blockedChannels](self->_context, "blockedChannels");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKInterceptableActivityViewController setExcludedActivityTypes:](v17, "setExcludedActivityTypes:", v18);

        v19 = self->_activityViewController;
        -[PKPassShareInitiationContext allowedChannels](self->_context, "allowedChannels");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKInterceptableActivityViewController setAllowedActivityTypes:](v19, "setAllowedActivityTypes:", v20);

        v10 = self->_activityViewController;
        if (-[PKPassShareInitiationContext environment](self->_context, "environment") == 2)
        {
          v21 = (void **)MEMORY[0x1E0D693D8];
        }
        else if (self->_isFromPeopleScreen)
        {
          v21 = (void **)MEMORY[0x1E0D693D0];
        }
        else
        {
          v21 = (void **)MEMORY[0x1E0D693C8];
        }
        v33 = *v21;
        analyticsReporter = self->_analyticsReporter;
        v48 = *MEMORY[0x1E0D693B0];
        v49 = v33;
        v35 = (void *)MEMORY[0x1E0C99D80];
        v36 = v33;
        v24 = 1;
        objc_msgSend(v35, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKShareInitiationAnalyticsReporter sendEventForPage:specifics:](analyticsReporter, "sendEventForPage:specifics:", 1, v37);

        v11 = 0;
        if (v10)
          goto LABEL_26;
        return;
      case 3uLL:
        -[PKPassShareInitiationNavigationController _updateShareActivationOptions](self, "_updateShareActivationOptions");
        v22 = -[PKPassSharePreviewViewController initWithSharesController:context:delegate:]([PKPassSharePreviewViewController alloc], "initWithSharesController:context:delegate:", self->_sharesController, self->_context, self);
        previewViewController = self->_previewViewController;
        self->_previewViewController = v22;

        v10 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", self->_previewViewController);
        -[PKShareInitiationAnalyticsReporter sendEventForPage:specifics:](self->_analyticsReporter, "sendEventForPage:specifics:", 2, 0);
        v11 = 0;
LABEL_12:
        v24 = 1;
        if (!v10)
          return;
        goto LABEL_26;
      case 4uLL:
        v25 = -[PKPassShareInitiationContext flow](self->_context, "flow");
        switch(v25)
        {
          case 6uLL:
            -[PKPassShareInitiationNavigationController _sendOveriMessageUsingComposeViewController](self, "_sendOveriMessageUsingComposeViewController");
            break;
          case 5uLL:
            -[PKPassShareInitiationNavigationController _sendOverLegacyCarKeyiMessage](self, "_sendOverLegacyCarKeyiMessage");
            break;
          case 1uLL:
            -[PKPassShareInitiationNavigationController _sendOveriMessage](self, "_sendOveriMessage");
            break;
          default:
            -[PKPassShareInitiationNavigationController _sendOverSelectedChannel](self, "_sendOverSelectedChannel");
            break;
        }
        return;
      case 5uLL:
        v10 = -[PKPassShareActivationOverviewNavigationController initWithContext:delegate:]([PKPassShareActivationOverviewNavigationController alloc], "initWithContext:delegate:", self->_context, self);
        v24 = 0;
        v11 = 1;
        if (!v10)
          return;
        goto LABEL_26;
      case 6uLL:
        v26 = [PKInterceptableActivityViewController alloc];
        -[PKPassShareInitiationNavigationController _activityItemForActivationCode](self, "_activityItemForActivationCode");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v27;
        v24 = 1;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[PKInterceptableActivityViewController initWithItems:delegate:](v26, "initWithItems:delegate:", v28, self);
        v30 = self->_activityViewController;
        self->_activityViewController = v29;

        v31 = self->_activityViewController;
        -[PKPassShareInitiationContext blockedChannels](self->_context, "blockedChannels");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKInterceptableActivityViewController setExcludedActivityTypes:](v31, "setExcludedActivityTypes:", v32);

        v10 = self->_activityViewController;
        v11 = 0;
        if (!v10)
          return;
LABEL_26:
        if (v9)
        {
          -[UIViewController pkui_frontMostViewController](self, "pkui_frontMostViewController");
          v38 = (PKPassShareInitiationNavigationController *)objc_claimAutoreleasedReturnValue();
          if (v38 == self)
            v39 = 1;
          else
            v39 = v24;
          if ((v39 & 1) == 0)
          {
            -[PKPassShareInitiationNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
            v40 = (PKInterceptableActivityViewController *)v38;
            if (v38 != (PKPassShareInitiationNavigationController *)self->_activityViewController)
            {
              -[PKPassShareInitiationNavigationController presentingViewController](v38, "presentingViewController");
              v41 = (PKInterceptableActivityViewController *)objc_claimAutoreleasedReturnValue();
              v42 = self->_activityViewController;

              if (v41 != v42)
              {
LABEL_35:
                v43 = self;
                goto LABEL_40;
              }
              v40 = self->_activityViewController;
            }
            self->_activityViewController = 0;

            goto LABEL_35;
          }
        }
        else
        {
          if (v11)
          {
            v46 = v10;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
            v38 = (PKPassShareInitiationNavigationController *)objc_claimAutoreleasedReturnValue();
            -[PKPassShareInitiationNavigationController setViewControllers:](self, "setViewControllers:", v38);
            goto LABEL_41;
          }
          v38 = (PKPassShareInitiationNavigationController *)objc_alloc_init(MEMORY[0x1E0DC3F20]);
          v45 = v38;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPassShareInitiationNavigationController setViewControllers:](self, "setViewControllers:", v44);

        }
        v43 = v38;
LABEL_40:
        -[PKPassShareInitiationNavigationController presentViewController:animated:completion:](v43, "presentViewController:animated:completion:", v10, 1, 0);
LABEL_41:

        break;
      default:
        return;
    }
  }
}

- (void)_sendOverLegacyCarKeyiMessage
{
  NSObject *v3;
  PKSharedPassSharesController *sharesController;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Sending share over car key IDS imessage channel", buf, 2u);
  }

  sharesController = self->_sharesController;
  -[PKPassShareInitiationContext composedShare](self->_context, "composedShare");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharedPassSharesController entitlementsForShare:](sharesController, "entitlementsForShare:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0D66AA8]);
  -[PKSharedPassSharesController pass](self->_sharesController, "pass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "paymentPass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithPaymentPass:entitlements:", v9, v6);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__PKPassShareInitiationNavigationController__sendOverLegacyCarKeyiMessage__block_invoke;
  v11[3] = &unk_1E3E77CD0;
  v11[4] = self;
  +[PKSharingMessageExtensionMessageBuilder messageFromSharingRequest:completionHandler:](PKSharingMessageExtensionMessageBuilder, "messageFromSharingRequest:completionHandler:", v10, v11);

}

void __74__PKPassShareInitiationNavigationController__sendOverLegacyCarKeyiMessage__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = (objc_class *)MEMORY[0x1E0CC68C8];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 1488);
  *(_QWORD *)(v6 + 1488) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1488), "setMessageComposeDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1488), "setMessage:", v4);

  objc_msgSend(*(id *)(a1 + 32), "pkui_frontMostViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentViewController:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1488), 1, 0);

}

- (void)_sendOveriMessage
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id buf[2];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Sending share over imessage extension", (uint8_t *)buf, 2u);
  }

  -[PKPassSharePreviewViewController setShowHeaderSpinner:](self->_previewViewController, "setShowHeaderSpinner:", 1);
  -[PKInterceptableActivityViewController view](self->_activityViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);

  -[PKPassShareInitiationContext composedShare](self->_context, "composedShare");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharedPassSharesController shareableEntitlements](self->_sharesController, "shareableEntitlements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateDisplayableSharedEntitlementsFromDisplayableEntitlements:", v6);

  v7 = objc_alloc(MEMORY[0x1E0D66EB8]);
  -[PKPassShareInitiationContext composedShare](self->_context, "composedShare");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharedPassSharesController pass](self->_sharesController, "pass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithShare:pass:", v8, v9);

  objc_initWeak(buf, self);
  -[PKSharingAnalyticsReporter sessionToken](self->_analyticsReporter, "sessionToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__PKPassShareInitiationNavigationController__sendOveriMessage__block_invoke;
  v12[3] = &unk_1E3E77CF8;
  objc_copyWeak(&v13, buf);
  +[PKSharingMessageExtensionMessageBuilder messageFromInvitation:analyticsSessionToken:completionHandler:](PKSharingMessageExtensionMessageBuilder, "messageFromInvitation:analyticsSessionToken:completionHandler:", v10, v11, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);

}

void __62__PKPassShareInitiationNavigationController__sendOveriMessage__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  _QWORD *WeakRetained;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_placeholderActivityItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:", v3);
    v8 = (void *)v6[190];
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setItems:", v9);

    v10 = (void *)v6[189];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__PKPassShareInitiationNavigationController__sendOveriMessage__block_invoke_2;
    v11[3] = &unk_1E3E61310;
    objc_copyWeak(&v12, v4);
    objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, v11);
    objc_destroyWeak(&v12);

  }
}

void __62__PKPassShareInitiationNavigationController__sendOveriMessage__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[190], "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setUserInteractionEnabled:", 1);

    objc_msgSend(v4[190], "handleInterceptedShareActivity");
    v3 = v4[189];
    v4[189] = 0;

    WeakRetained = v4;
  }

}

- (void)_sendOveriMessageUsingComposeViewController
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id buf[2];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Sending share over imessage using imessage compose VC", (uint8_t *)buf, 2u);
  }

  -[PKPassSharePreviewViewController setShowHeaderSpinner:](self->_previewViewController, "setShowHeaderSpinner:", 1);
  -[PKPassShareInitiationContext composedShare](self->_context, "composedShare");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharedPassSharesController shareableEntitlements](self->_sharesController, "shareableEntitlements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateDisplayableSharedEntitlementsFromDisplayableEntitlements:", v5);

  v6 = objc_alloc(MEMORY[0x1E0D66EB8]);
  -[PKPassShareInitiationContext composedShare](self->_context, "composedShare");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharedPassSharesController pass](self->_sharesController, "pass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithShare:pass:", v7, v8);

  objc_initWeak(buf, self);
  -[PKSharingAnalyticsReporter sessionToken](self->_analyticsReporter, "sessionToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__PKPassShareInitiationNavigationController__sendOveriMessageUsingComposeViewController__block_invoke;
  v11[3] = &unk_1E3E77CF8;
  objc_copyWeak(&v12, buf);
  +[PKSharingMessageExtensionMessageBuilder messageFromInvitation:analyticsSessionToken:completionHandler:](PKSharingMessageExtensionMessageBuilder, "messageFromInvitation:analyticsSessionToken:completionHandler:", v9, v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(buf);

}

void __88__PKPassShareInitiationNavigationController__sendOveriMessageUsingComposeViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CC68C8]);
    v6 = WeakRetained[186];
    WeakRetained[186] = v5;

    objc_msgSend(WeakRetained[186], "setMessageComposeDelegate:", WeakRetained);
    objc_msgSend(WeakRetained[186], "setMessage:", v3);
    objc_msgSend(WeakRetained, "pkui_frontMostViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = WeakRetained[186];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __88__PKPassShareInitiationNavigationController__sendOveriMessageUsingComposeViewController__block_invoke_2;
    v9[3] = &unk_1E3E612E8;
    v9[4] = WeakRetained;
    objc_msgSend(v7, "presentViewController:animated:completion:", v8, 1, v9);

  }
}

uint64_t __88__PKPassShareInitiationNavigationController__sendOveriMessageUsingComposeViewController__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1512), "setShowHeaderSpinner:", 0);
}

- (void)_sendOverSelectedChannel
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[7];
  id v22;
  _QWORD aBlock[4];
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  uint8_t *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  uint8_t buf[8];
  uint8_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  id location[2];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Sending share over previously selected channel", buf, 2u);
  }

  -[PKPassShareInitiationContext composedShare](self->_context, "composedShare");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharedPassSharesController shareableEntitlements](self->_sharesController, "shareableEntitlements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateDisplayableSharedEntitlementsFromDisplayableEntitlements:", v5);

  v6 = objc_alloc(MEMORY[0x1E0D66EB8]);
  -[PKPassShareInitiationContext composedShare](self->_context, "composedShare");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharedPassSharesController pass](self->_sharesController, "pass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithShare:pass:", v7, v8);

  objc_initWeak(location, self);
  *(_QWORD *)buf = 0;
  v34 = buf;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__55;
  v37 = __Block_byref_object_dispose__55;
  v38 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__55;
  v31[4] = __Block_byref_object_dispose__55;
  v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__55;
  v29[4] = __Block_byref_object_dispose__55;
  v30 = 0;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[2] = __69__PKPassShareInitiationNavigationController__sendOverSelectedChannel__block_invoke;
  aBlock[3] = &unk_1E3E77D70;
  aBlock[1] = 3221225472;
  objc_copyWeak(&v28, location);
  v11 = v9;
  v24 = v11;
  v25 = v31;
  v26 = v29;
  v27 = buf;
  v12 = _Block_copy(aBlock);
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __69__PKPassShareInitiationNavigationController__sendOverSelectedChannel__block_invoke_4;
  v21[3] = &unk_1E3E77D98;
  objc_copyWeak(&v22, location);
  v21[4] = buf;
  v21[5] = v31;
  v21[6] = v29;
  v13 = _Block_copy(v21);
  v14 = -[PKPassShareInitiationContext authenticationType](self->_context, "authenticationType");
  if (v14)
  {
    if (v14 == 1)
    {
      PKShareAuthorizationPaymentRequest((PKPartialShareInvitation *)v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassShareInitiationNavigationController view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "window");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "windowScene");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_sceneIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (id)objc_msgSend(MEMORY[0x1E0D67670], "authorizeForRequest:presentationSceneIdentifier:authHandler:completion:", v15, v19, v12, v13);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D67670], "authorizeDeviceOwnerWithAuthHandler:completion:", v12, v13);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v28);
  _Block_object_dispose(v29, 8);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(location);
}

void __69__PKPassShareInitiationNavigationController__sendOverSelectedChannel__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  __int128 v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PKPassShareInitiationNavigationController__sendOverSelectedChannel__block_invoke_2;
  block[3] = &unk_1E3E77D48;
  objc_copyWeak(&v15, (id *)(a1 + 64));
  v10 = *(id *)(a1 + 32);
  v11 = v5;
  v13 = *(_OWORD *)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 56);
  v12 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v15);
}

void __69__PKPassShareInitiationNavigationController__sendOverSelectedChannel__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  __int128 v8;
  _QWORD v9[4];
  __int128 v10;
  __int128 v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[188], "sendAuthenticationEventForSuccess:specifics:", 1, 0);
    objc_msgSend(v3[189], "setShowHeaderSpinner:", 1);
    v4 = v3[184];
    v9[1] = 3221225472;
    v8 = *(_OWORD *)(a1 + 48);
    v11 = *(_OWORD *)(a1 + 64);
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[2] = __69__PKPassShareInitiationNavigationController__sendOverSelectedChannel__block_invoke_3;
    v9[3] = &unk_1E3E77D20;
    v7 = (id)v8;
    v10 = v8;
    objc_msgSend(v4, "createShareWithPartialShare:authorization:completion:", v6, v5, v9);

  }
}

void __69__PKPassShareInitiationNavigationController__sendOverSelectedChannel__block_invoke_3(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  _BOOL8 v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1[5] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;
  v19 = v7;

  v12 = *(_QWORD *)(a1[6] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v8;
  v14 = v8;

  v15 = *(_QWORD *)(a1[7] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v9;
  v17 = v9;

  if (v17)
    v18 = 0;
  else
    v18 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) != 0;
  (*(void (**)(_QWORD, _BOOL8))(a1[4] + 16))(a1[4], v18);

}

void __69__PKPassShareInitiationNavigationController__sendOverSelectedChannel__block_invoke_4(uint64_t a1, char a2)
{
  id *WeakRetained;
  id *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  void *v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[189], "setShowHeaderSpinner:", 0);
    v6 = objc_msgSend(v5[187], "flow");
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (v7 || (a2 & 1) != 0)
    {
      if (v6 == 4)
      {
        v9 = objc_loadWeakRetained(v5 + 193);
        v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "activationOptions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "activationCode");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "didCreateShareURL:activationCode:error:", v10, v12, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

        objc_msgSend(v5, "_flowDidFinishWithSuccess");
      }
      else if (v7)
      {
        objc_msgSend(v5, "_flowDidCancelWithError:");
      }
      else
      {
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
          objc_msgSend(v5[187], "setComposedShare:");
        objc_msgSend(v5[187], "setDidCreateShare:", 1);
        objc_msgSend(v5, "_placeholderActivityItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setValue:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
        PKLogFacilityTypeGetObject();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "absoluteString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          PKSharingLoggableMailboxAddress();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v23 = v16;
          _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "ShareInitiation: using share url: %{public}@", buf, 0xCu);

        }
        v17 = v5[190];
        v21 = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setItems:", v18);

        v19 = v5[189];
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __69__PKPassShareInitiationNavigationController__sendOverSelectedChannel__block_invoke_33;
        v20[3] = &unk_1E3E612E8;
        v20[4] = v5;
        objc_msgSend(v19, "dismissViewControllerAnimated:completion:", 1, v20);

      }
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Auth canceled", buf, 2u);
      }

      objc_msgSend(v5[188], "sendAuthenticationEventForSuccess:specifics:", 0, 0);
      objc_msgSend(v5, "_transitionToStep:", 3);
    }
  }

}

void __69__PKPassShareInitiationNavigationController__sendOverSelectedChannel__block_invoke_33(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1520), "handleInterceptedShareActivity");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1512);
  *(_QWORD *)(v2 + 1512) = 0;

}

- (void)_flowDidCancelWithError:(id)a3
{
  PKShareInitiationAnalyticsReporter *analyticsReporter;
  NSError *v5;
  PKShareInitiationAnalyticsReporter *v6;
  void *v7;
  NSError *v8;
  PKSecureElementPass *v9;
  id v10;
  void *v11;
  _QWORD v12[5];

  analyticsReporter = self->_analyticsReporter;
  v5 = (NSError *)a3;
  -[PKShareInitiationAnalyticsReporter sendDoneEventWithDidShare:error:specifics:](analyticsReporter, "sendDoneEventWithDidShare:error:specifics:", 0, v5, 0);
  v6 = self->_analyticsReporter;
  self->_analyticsReporter = 0;

  PKSharingDisplayableError(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pkSharingError:", 7);
    v8 = (NSError *)objc_claimAutoreleasedReturnValue();
    -[PKSharedPassSharesController pass](self->_sharesController, "pass");
    v9 = (PKSecureElementPass *)objc_claimAutoreleasedReturnValue();
    PKSharingDisplayableError(v8, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__PKPassShareInitiationNavigationController__flowDidCancelWithError___block_invoke;
  v12[3] = &unk_1E3E612E8;
  v12[4] = self;
  v10 = PKAlertForDisplayableErrorWithHandlers(v7, 0, v12, 0);
  -[UIViewController pkui_frontMostViewController](self, "pkui_frontMostViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentViewController:animated:completion:", v10, 1, 0);

}

uint64_t __69__PKPassShareInitiationNavigationController__flowDidCancelWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_flowDidCancel");
}

- (void)_flowDidCancel
{
  PKShareInitiationAnalyticsReporter *analyticsReporter;
  _QWORD v4[5];

  -[PKShareInitiationAnalyticsReporter sendDoneEventWithDidShare:error:specifics:](self->_analyticsReporter, "sendDoneEventWithDidShare:error:specifics:", 0, 0, 0);
  analyticsReporter = self->_analyticsReporter;
  self->_analyticsReporter = 0;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__PKPassShareInitiationNavigationController__flowDidCancel__block_invoke;
  v4[3] = &unk_1E3E612E8;
  v4[4] = self;
  -[PKPassShareInitiationNavigationController _revokeCreatedShareWithCompletion:](self, "_revokeCreatedShareWithCompletion:", v4);
}

void __59__PKPassShareInitiationNavigationController__flowDidCancel__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id *v4;
  id v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Flow did cancel", v8, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1544));
  v4 = *(id **)(a1 + 32);
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(v4 + 193);
    objc_msgSend(v5, "didFinishShareWithDidUserShare:error:", 0, 0);
  }
  else
  {
    objc_msgSend(v4, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
      v7 = *(void **)(a1 + 32);
    v5 = v7;

    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)_flowDidFinishWithSuccess
{
  NSObject *v3;
  PKShareInitiationAnalyticsReporter *analyticsReporter;
  id WeakRetained;
  PKPassShareInitiationNavigationController *v6;
  uint64_t v7;
  void *v8;
  PKPassShareInitiationNavigationController *v9;
  uint8_t v10[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Flow did finish with success", v10, 2u);
  }

  -[PKShareInitiationAnalyticsReporter sendDoneEventWithDidShare:error:specifics:](self->_analyticsReporter, "sendDoneEventWithDidShare:error:specifics:", 1, 0, 0);
  analyticsReporter = self->_analyticsReporter;
  self->_analyticsReporter = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_shareDelegate);
  if (WeakRetained)
  {
    v6 = (PKPassShareInitiationNavigationController *)objc_loadWeakRetained((id *)&self->_shareDelegate);
    -[PKPassShareInitiationNavigationController didFinishShareWithDidUserShare:error:](v6, "didFinishShareWithDidUserShare:error:", 1, 0);
  }
  else
  {
    -[PKPassShareInitiationNavigationController presentingViewController](self, "presentingViewController");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (PKPassShareInitiationNavigationController *)v7;
    else
      v9 = self;
    v6 = v9;

    -[PKPassShareInitiationNavigationController dismissViewControllerAnimated:completion:](v6, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)_revokeCreatedShareWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  PKSharedPassSharesController *sharesController;
  void *v6;
  _QWORD v7[4];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if (-[PKPassShareInitiationContext didCreateShare](self->_context, "didCreateShare"))
  {
    sharesController = self->_sharesController;
    -[PKPassShareInitiationContext composedShare](self->_context, "composedShare");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __79__PKPassShareInitiationNavigationController__revokeCreatedShareWithCompletion___block_invoke;
    v7[3] = &unk_1E3E63438;
    v8 = v4;
    -[PKSharedPassSharesController revokeShare:shouldCascade:withCompletion:](sharesController, "revokeShare:shouldCascade:withCompletion:", v6, 0, v7);

    -[PKPassShareInitiationContext setDidCreateShare:](self->_context, "setDidCreateShare:", 0);
  }
  else if (v4)
  {
    v4[2](v4);
  }

}

uint64_t __79__PKPassShareInitiationNavigationController__revokeCreatedShareWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updateShareActivationOptions
{
  unint64_t v3;
  NSObject *v4;
  unint64_t v5;
  void *v6;
  _BOOL8 v9;
  PKSharedPassSharesController *sharesController;
  void *v11;
  void *v12;
  void *v13;
  PKPassShareInitiationContext *context;
  void *v15;
  id v16;
  uint8_t buf[16];

  v3 = -[PKPassShareInitiationContext flow](self->_context, "flow");
  if (v3 == 5)
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Not setting activation options because legacy car key share", buf, 2u);
    }

  }
  else
  {
    v5 = v3;
    -[PKPassShareInitiationContext recipient](self->_context, "recipient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v5 == 1 || v6 != 0 || v5 == 6;

    sharesController = self->_sharesController;
    -[PKPassShareInitiationContext channelBundleIdentifier](self->_context, "channelBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSharedPassSharesController shareInitiationActivationConfigurationForChannelBundleIdentifier:isRecipientKnownContact:](sharesController, "shareInitiationActivationConfigurationForChannelBundleIdentifier:isRecipientKnownContact:", v11, v9);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    -[PKPassShareInitiationContext composedShare](self->_context, "composedShare");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "defaultOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActivationOptions:", v13);

    context = self->_context;
    objc_msgSend(v16, "availableOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassShareInitiationContext setAvailableActivationOptions:](context, "setAvailableActivationOptions:", v15);

    -[PKPassShareInitiationContext setActivationOptionsUserEditable:](self->_context, "setActivationOptionsUserEditable:", objc_msgSend(v16, "allowUserEdit"));
  }
}

- (id)_placeholderActivityItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PKPassShareInitiationContext sharePreviewTitle](self->_context, "sharePreviewTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareInitiationContext sharePreviewSubtitle](self->_context, "sharePreviewSubtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareInitiationContext sharePreviewImageURL](self->_context, "sharePreviewImageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareInitiationContext sharePreviewFallbackImage](self->_context, "sharePreviewFallbackImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKActivityItemSource placeholderURLItemWithTitle:subtitle:iconURL:iconPlaceholder:](PKActivityItemSource, "placeholderURLItemWithTitle:subtitle:iconURL:iconPlaceholder:", v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_activityItemForActivationCode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKPassShareInitiationNavigationController _placeholderActivityItem](self, "_placeholderActivityItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareInitiationContext composedShare](self->_context, "composedShare");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activationOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activationCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setValue:", v6);
  return v3;
}

- (void)sharePreviewViewControllerDidCancel:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  PKPassShareInitiationNavigationController *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  PKPassShareInitiationNavigationController *v16;

  v4 = a3;
  v5 = -[PKPassShareInitiationContext flow](self->_context, "flow");
  if (v5 <= 6)
  {
    if (((1 << v5) & 0x1B) != 0)
    {
      v7 = MEMORY[0x1E0C809B0];
      v8 = 3221225472;
      v9 = __81__PKPassShareInitiationNavigationController_sharePreviewViewControllerDidCancel___block_invoke_2;
      v10 = &unk_1E3E612E8;
      v11 = self;
      v6 = &v7;
    }
    else
    {
      if (-[PKPassShareInitiationContext environment](self->_context, "environment") != 2)
      {
        -[PKPassShareInitiationNavigationController _flowDidCancel](self, "_flowDidCancel");
        goto LABEL_8;
      }
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __81__PKPassShareInitiationNavigationController_sharePreviewViewControllerDidCancel___block_invoke;
      v15 = &unk_1E3E612E8;
      v16 = self;
      v6 = &v12;
    }
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
  }
LABEL_8:

}

uint64_t __81__PKPassShareInitiationNavigationController_sharePreviewViewControllerDidCancel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transitionToStep:", 1);
}

uint64_t __81__PKPassShareInitiationNavigationController_sharePreviewViewControllerDidCancel___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transitionToStep:", 2);
}

- (void)sharePreviewViewControllerDidContinue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  id v21;

  -[PKPassShareInitiationContext composedShare](self->_context, "composedShare", a3);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = objc_alloc(MEMORY[0x1E0D66EE8]);
  objc_msgSend(v21, "sharedEntitlements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharedPassSharesController shareableEntitlements](self->_sharesController, "shareableEntitlements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithSharedEntitlements:availableEntitlements:editable:", v6, v7, 1);

  if ((objc_msgSend(v8, "canAllowResharing") & 1) != 0)
  {
    objc_msgSend(v8, "globalView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shareability");

    v11 = *MEMORY[0x1E0D695B0];
    v12 = *MEMORY[0x1E0D695A8];
    if (v10)
      v13 = *MEMORY[0x1E0D695B0];
    else
      v13 = *MEMORY[0x1E0D695A8];
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D694E8]);
  }
  else
  {
    v11 = *MEMORY[0x1E0D695B0];
    v12 = *MEMORY[0x1E0D695A8];
  }
  objc_msgSend(v21, "sharedEntitlements");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharedPassSharesController baseNewShareForPass](self->_sharesController, "baseNewShareForPass");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sharedEntitlements");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = PKEqualObjects();

  v18 = (_QWORD *)MEMORY[0x1E0D694C0];
  if (v17)
    v18 = (_QWORD *)MEMORY[0x1E0D694C8];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *v18, *MEMORY[0x1E0D694B8]);
  objc_msgSend(v21, "activationOptions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    v20 = v11;
  else
    v20 = v12;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D694E0]);

  -[PKShareInitiationAnalyticsReporter sendEventForPage:button:specifics:](self->_analyticsReporter, "sendEventForPage:button:specifics:", 2, 2, v4);
  -[PKPassShareInitiationNavigationController _transitionToNextStep](self, "_transitionToNextStep");

}

- (BOOL)interceptableActivityViewController:(id)a3 shouldInterceptActivitySelectionOfType:(id)a4
{
  return self->_currentStep == 2;
}

- (void)interceptableActivityViewController:(id)a3 didInterceptActivitySelectionOfType:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  id *v10;
  uint64_t v11;
  int v12;
  id v13;
  void *v14;
  id v15;
  int v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  PKSharedPassSharesController *sharesController;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  PKShareInitiationAnalyticsReporter *analyticsReporter;
  void *v29;
  id v30;
  void *v31;
  int v32;
  uint8_t buf[16];
  id v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (PKEqualObjects() && (PKSharingUseIMessageExtension() & 1) != 0)
  {
    v8 = 0;
    v9 = 1;
    v10 = (id *)MEMORY[0x1E0D69508];
    v11 = 1;
  }
  else if ((PKEqualObjects() & 1) != 0)
  {
    v9 = 0;
    v8 = 1;
    v10 = (id *)MEMORY[0x1E0D69500];
    v11 = 2;
  }
  else
  {
    v12 = PKEqualObjects();
    v8 = 0;
    v9 = 0;
    v10 = (id *)MEMORY[0x1E0D69520];
    if (v12)
      v10 = (id *)MEMORY[0x1E0D69518];
    v11 = 3;
  }
  v13 = *v10;
  -[PKPassShareInitiationContext setFlow:](self->_context, "setFlow:", v11);
  -[PKPassShareInitiationContext setChannelBundleIdentifier:](self->_context, "setChannelBundleIdentifier:", v7);
  if (v8)
  {
    v34 = 0;
    objc_msgSend(v6, "selectedRecipientWithOutContactIdentifier:", &v34);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v8;
    v15 = v7;
    v16 = v9;
    v17 = v34;
    objc_msgSend(MEMORY[0x1E0D66C60], "defaultContactResolver");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contactForIdentifier:", v17);
    v19 = v6;
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPassShareInitiationContext setRecipient:fallbackNickname:](self->_context, "setRecipient:fallbackNickname:", v20, v14);
    v9 = v16;
    v7 = v15;
    v8 = v32;

    v6 = v19;
  }
  v21 = v8 | v9;
  sharesController = self->_sharesController;
  -[PKPassShareInitiationContext channelBundleIdentifier](self->_context, "channelBundleIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = -[PKSharedPassSharesController isSharingChannelBlockedForChannel:isRecipientKnownContact:](sharesController, "isSharingChannelBlockedForChannel:isRecipientKnownContact:", v23, v21);

  if ((_DWORD)v21)
  {
    PKLogFacilityTypeGetObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v24, OS_LOG_TYPE_DEFAULT, "ShareInitiation: Trying to share over blocked sharing channel", buf, 2u);
    }

    PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_SECURITY_CHANNEL_BLOCKED_TITLE"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedShareableCredentialString(CFSTR("SHAREABLE_MESSAGES_SECURITY_CHANNEL_BLOCKED_BODY"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PKDisplayableErrorCustom();
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[PKPassShareInitiationNavigationController _flowDidCancelWithError:](self, "_flowDidCancelWithError:", v27);
    }
    else
    {
      v30 = PKAlertForDisplayableErrorWithHandlers(v27, 0, 0, 0);
      -[UIViewController pkui_frontMostViewController](self, "pkui_frontMostViewController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "presentViewController:animated:completion:", v30, 1, 0);

    }
  }
  else
  {
    analyticsReporter = self->_analyticsReporter;
    v35 = *MEMORY[0x1E0D69510];
    v36[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKShareInitiationAnalyticsReporter sendEventForPage:button:specifics:](analyticsReporter, "sendEventForPage:button:specifics:", 1, 2, v29);

    -[PKPassShareInitiationNavigationController _transitionToNextStep](self, "_transitionToNextStep");
  }

}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  -[PKPassShareInitiationNavigationController shareActivityDidFinishWithShare:](self, "shareActivityDidFinishWithShare:", a4 == 1);
}

- (void)interceptableActivityViewController:(id)a3 didFinishWithShare:(BOOL)a4
{
  -[PKPassShareInitiationNavigationController shareActivityDidFinishWithShare:](self, "shareActivityDidFinishWithShare:", a4);
}

- (void)shareActivityDidFinishWithShare:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  BOOL v6;
  PKSharedPassSharesController *sharesController;
  unint64_t currentStep;
  PKPassShareInitiationNavigationController *v9;
  uint64_t v10;
  PKInterceptableActivityViewController *activityViewController;
  void *v12;
  PKInterceptableActivityViewController *v13;
  void *v14;
  void *v15;
  PKPassShareInitiationNavigationController *v16;
  uint64_t v17;
  MFMessageComposeViewController *carKeyMessageComposer;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[2];

  v3 = a3;
  v21[1] = *MEMORY[0x1E0C80C00];
  if (self->_currentStep == 2 && !a3)
    -[PKShareInitiationAnalyticsReporter sendEventForPage:button:specifics:](self->_analyticsReporter, "sendEventForPage:button:specifics:", 1, 1, 0);
  if (!v3)
  {
    currentStep = self->_currentStep;
    if (currentStep == 6)
    {
      v9 = self;
      v10 = 5;
      goto LABEL_19;
    }
    if (currentStep != 4)
    {
      if (currentStep != 2)
        return;
      if (-[PKPassShareInitiationContext environment](self->_context, "environment") == 2)
      {
        v9 = self;
        v10 = 1;
LABEL_19:
        -[PKPassShareInitiationNavigationController _transitionToStep:](v9, "_transitionToStep:", v10);
        return;
      }
LABEL_23:
      -[PKPassShareInitiationNavigationController _flowDidCancel](self, "_flowDidCancel");
      return;
    }
    activityViewController = self->_activityViewController;
    if (activityViewController)
    {
      -[PKInterceptableActivityViewController presentingViewController](activityViewController, "presentingViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        goto LABEL_23;
      -[PKPassShareInitiationNavigationController _revokeCreatedShareWithCompletion:](self, "_revokeCreatedShareWithCompletion:", 0);
      v13 = self->_activityViewController;
      -[PKPassShareInitiationNavigationController _placeholderActivityItem](self, "_placeholderActivityItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKInterceptableActivityViewController setItems:](v13, "setItems:", v15);

      v16 = self;
      v17 = 2;
    }
    else
    {
      if (!self->_carKeyMessageComposer)
        return;
      -[PKPassShareInitiationNavigationController _revokeCreatedShareWithCompletion:](self, "_revokeCreatedShareWithCompletion:", 0);
      carKeyMessageComposer = self->_carKeyMessageComposer;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __77__PKPassShareInitiationNavigationController_shareActivityDidFinishWithShare___block_invoke_2;
      v19[3] = &unk_1E3E612E8;
      v19[4] = self;
      -[MFMessageComposeViewController dismissViewControllerAnimated:completion:](carKeyMessageComposer, "dismissViewControllerAnimated:completion:", 1, v19);
      v16 = self;
      v17 = 3;
    }
    -[PKPassShareInitiationNavigationController _transitionToStep:](v16, "_transitionToStep:", v17);
    return;
  }
  v5 = -[PKPassShareInitiationContext flow](self->_context, "flow");
  v6 = v5 == 6 || v5 == 1;
  if (v6 && self->_currentStep == 4)
  {
    sharesController = self->_sharesController;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __77__PKPassShareInitiationNavigationController_shareActivityDidFinishWithShare___block_invoke;
    v20[3] = &unk_1E3E612E8;
    v20[4] = self;
    -[PKSharedPassSharesController updateSharesWithCompletion:](sharesController, "updateSharesWithCompletion:", v20);
  }
  else
  {
    -[PKPassShareInitiationNavigationController _transitionToNextStep](self, "_transitionToNextStep");
  }
}

void __77__PKPassShareInitiationNavigationController_shareActivityDidFinishWithShare___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1472), "mostRecentlyCreatedShare");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(id **)(a1 + 32);
  v4 = (id)v2;
  if (v2)
  {
    objc_msgSend(v3[187], "setComposedShare:", v2);
    objc_msgSend(*(id *)(a1 + 32), "_transitionToNextStep");
  }
  else
  {
    objc_msgSend(v3, "_flowDidCancel");
  }

}

void __77__PKPassShareInitiationNavigationController_shareActivityDidFinishWithShare___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 1488);
  *(_QWORD *)(v1 + 1488) = 0;

}

- (void)passShareIntroductionExplanationViewControllerDidContinue:(id)a3
{
  PKSharedPassSharesController *sharesController;
  _QWORD v4[5];

  sharesController = self->_sharesController;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __103__PKPassShareInitiationNavigationController_passShareIntroductionExplanationViewControllerDidContinue___block_invoke;
  v4[3] = &unk_1E3E646D0;
  v4[4] = self;
  -[PKSharedPassSharesController canSendInvitationWithCompletion:](sharesController, "canSendInvitationWithCompletion:", v4);
}

void __103__PKPassShareInitiationNavigationController_passShareIntroductionExplanationViewControllerDidContinue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[5];

  if (a2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __103__PKPassShareInitiationNavigationController_passShareIntroductionExplanationViewControllerDidContinue___block_invoke_2;
    v4[3] = &unk_1E3E612E8;
    v4[4] = *(_QWORD *)(a1 + 32);
    v3 = PKAlertForDisplayableErrorWithHandlers(a2, 0, v4, 0);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v3, 1, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_transitionToNextStep");
  }
}

uint64_t __103__PKPassShareInitiationNavigationController_passShareIntroductionExplanationViewControllerDidContinue___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_flowDidCancel");
}

- (void)passShareIntroductionExplanationViewControllerDidCancel:(id)a3
{
  -[PKShareInitiationAnalyticsReporter sendEventForPage:button:specifics:](self->_analyticsReporter, "sendEventForPage:button:specifics:", 2, 1, 0);
  -[PKPassShareInitiationNavigationController _flowDidCancel](self, "_flowDidCancel");
}

- (void)shareActivationOverviewViewControllerDidSelectShareCode:(id)a3
{
  -[PKPassShareInitiationNavigationController _transitionToStep:](self, "_transitionToStep:", 6);
}

- (PKClientShareSecureElementPassViewControllerDelegate)shareDelegate
{
  return (PKClientShareSecureElementPassViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_shareDelegate);
}

- (void)setShareDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_shareDelegate, a3);
}

- (BOOL)isFromPeopleScreen
{
  return self->_isFromPeopleScreen;
}

- (void)setIsFromPeopleScreen:(BOOL)a3
{
  self->_isFromPeopleScreen = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shareDelegate);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_previewViewController, 0);
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_carKeyMessageComposer, 0);
  objc_storeStrong((id *)&self->_messageComposer, 0);
  objc_storeStrong((id *)&self->_sharesController, 0);
}

@end
