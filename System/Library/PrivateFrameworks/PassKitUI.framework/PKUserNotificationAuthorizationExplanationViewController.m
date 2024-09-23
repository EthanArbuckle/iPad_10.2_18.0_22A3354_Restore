@implementation PKUserNotificationAuthorizationExplanationViewController

- (PKUserNotificationAuthorizationExplanationViewController)initWithController:(id)a3 context:(int64_t)a4 dataProvider:(id)a5
{
  return -[PKUserNotificationAuthorizationExplanationViewController initWithController:contentType:context:dataProvider:](self, "initWithController:contentType:context:dataProvider:", a3, 0, a4, a5);
}

- (PKUserNotificationAuthorizationExplanationViewController)initWithController:(id)a3 contentType:(unint64_t)a4 context:(int64_t)a5 dataProvider:(id)a6
{
  id v11;
  id v12;
  PKUserNotificationAuthorizationExplanationViewController *v13;
  PKUserNotificationAuthorizationExplanationViewController *v14;
  NSString *v15;
  NSString *productType;
  id *v17;
  NSString *v18;
  NSString *referralSource;
  objc_super v21;

  v11 = a3;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PKUserNotificationAuthorizationExplanationViewController;
  v13 = -[PKExplanationViewController initWithContext:](&v21, sel_initWithContext_, a5);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_controller, a3);
    objc_storeStrong((id *)&v14->_dataProvider, a6);
    v14->_contentTypeToDisplay = a4;
    if (a4 <= 6)
      v15 = (NSString *)**((id **)&unk_1E3E70080 + a4);
    productType = v14->_productType;
    v14->_productType = v15;

    v14->_didBeginWalletSettingsSubject = 0;
    v14->_isPresentingNotificationAuthorizationPrompt = 0;
    v14->_contentLock._os_unfair_lock_opaque = 0;
    v14->_statusLock._os_unfair_lock_opaque = 0;
    switch(a5)
    {
      case 0:
        v17 = (id *)MEMORY[0x1E0D68E90];
        goto LABEL_10;
      case 4:
        v17 = (id *)MEMORY[0x1E0D68E80];
        goto LABEL_10;
      case 3:
        v17 = (id *)MEMORY[0x1E0D68E88];
LABEL_10:
        v18 = (NSString *)*v17;
        referralSource = v14->_referralSource;
        v14->_referralSource = v18;

        break;
    }
  }

  return v14;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKUserNotificationAuthorizationExplanationViewController;
  -[PKUserNotificationAuthorizationExplanationViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKUserNotificationAuthorizationExplanationViewController _beginReportingIfNecessary](self, "_beginReportingIfNecessary");
  -[PKUserNotificationAuthorizationExplanationViewController _reportViewDidAppear](self, "_reportViewDidAppear");
}

- (void)loadView
{
  NSObject *v3;
  NSString *title;
  NSString *body;
  NSString *continueString;
  CGImage *cgExplanationImage;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CGFloat v16;
  void *v17;
  void *v18;
  NSString *v19;
  void *v20;
  void *v21;
  NSString *v22;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;
  CGRect v27;

  v26 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)PKUserNotificationAuthorizationExplanationViewController;
  -[PKExplanationViewController loadView](&v23, sel_loadView);
  if (!-[PKUserNotificationAuthorizationExplanationViewController _preflightStatus](self, "_preflightStatus"))
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[PKUserNotificationAuthorizationExplanationViewController loadView]";
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Warning - %s loading view before preflight is called. Preflighting now, may cause hang if MobileAssets is slow to respond", buf, 0xCu);
    }

    -[PKUserNotificationAuthorizationExplanationViewController _loadContentFromMobileAssets](self, "_loadContentFromMobileAssets");
  }
  os_unfair_lock_lock(&self->_contentLock);
  title = self->_title;
  body = self->_body;
  continueString = self->_continueString;
  cgExplanationImage = self->_cgExplanationImage;
  v8 = self->_notNowString;
  v9 = continueString;
  v22 = body;
  v10 = title;
  os_unfair_lock_unlock(&self->_contentLock);
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitleText:", v10);
  objc_msgSend(v11, "setBodyText:", v22);
  objc_msgSend(v11, "setShowPrivacyView:", 0);
  PKProvisioningSecondaryBackgroundColor();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTopBackgroundColor:", v12);

  objc_msgSend(v11, "setImageIgnoresTopSafeArea:", 1);
  objc_msgSend(v11, "setForceShowSetupLaterButton:", 1);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", cgExplanationImage);
  objc_msgSend(v11, "setImage:", v13);
  objc_msgSend(v11, "imageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContentMode:", 1);

  -[PKUserNotificationAuthorizationExplanationViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v16 = CGRectGetHeight(v27) * 0.5;

  objc_msgSend(v11, "setMaxImageHeight:", v16);
  objc_msgSend(v11, "dockView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "primaryButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v9;
  objc_msgSend(v18, "setTitle:forState:", v9, 0);

  objc_msgSend(v17, "footerView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setForceShowSetupLaterButton:", 1);
  objc_msgSend(v20, "setManualEntryButton:", 0);
  objc_msgSend(v20, "setupLaterButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTitle:forState:", v8, 0);

  -[PKUserNotificationAuthorizationController setPresentedNotificationAuthorizationPromptShown](self->_controller, "setPresentedNotificationAuthorizationPromptShown");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void (**nextStepHandler)(void);
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKUserNotificationAuthorizationExplanationViewController;
  -[PKUserNotificationAuthorizationExplanationViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  nextStepHandler = (void (**)(void))self->_nextStepHandler;
  if (nextStepHandler)
  {
    nextStepHandler[2]();
    v5 = self->_nextStepHandler;
    self->_nextStepHandler = 0;

  }
}

- (void)dealloc
{
  objc_super v3;

  -[PKUserNotificationAuthorizationExplanationViewController _endReportingIfNecessary](self, "_endReportingIfNecessary");
  v3.receiver = self;
  v3.super_class = (Class)PKUserNotificationAuthorizationExplanationViewController;
  -[PKUserNotificationAuthorizationExplanationViewController dealloc](&v3, sel_dealloc);
}

- (void)preflightWithCompletion:(id)a3
{
  void (**v4)(id, BOOL);
  unint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  void (**v8)(id, BOOL);

  v4 = (void (**)(id, BOOL))a3;
  v5 = -[PKUserNotificationAuthorizationExplanationViewController _preflightStatus](self, "_preflightStatus");
  if (v5)
  {
    if (v4)
      v4[2](v4, v5 == 1);
  }
  else
  {
    -[PKUserNotificationAuthorizationExplanationViewController _setPreflightStatus:](self, "_setPreflightStatus:", 2);
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __84__PKUserNotificationAuthorizationExplanationViewController_preflightWithCompletion___block_invoke;
    v7[3] = &unk_1E3E61850;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v6, v7);

  }
}

void __84__PKUserNotificationAuthorizationExplanationViewController_preflightWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadContentFromMobileAssets");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __84__PKUserNotificationAuthorizationExplanationViewController_preflightWithCompletion___block_invoke_2;
  v3[3] = &unk_1E3E61850;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __84__PKUserNotificationAuthorizationExplanationViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_setPreflightStatus:", 1);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)_loadContentFromMobileAssets
{
  NSString *v3;
  NSString *continueString;
  NSString *v5;
  NSString *notNowString;
  NSString *v7;
  NSString *title;
  const __CFString *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  NSString *body;
  void *v22;
  NSString *v23;
  NSString *v24;
  id v25;

  +[PKMANotificationAuthorizationAssetManager sharedInstance](PKMANotificationAuthorizationAssetManager, "sharedInstance");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_contentLock);
  objc_msgSend(v25, "notificationAuthorizationString:", CFSTR("NOTIFICATIONS_CONTINUE"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  continueString = self->_continueString;
  self->_continueString = v3;

  objc_msgSend(v25, "notificationAuthorizationString:", CFSTR("NOTIFICATIONS_NOT_NOW"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  notNowString = self->_notNowString;
  self->_notNowString = v5;

  switch(self->_contentTypeToDisplay)
  {
    case 0uLL:
      objc_msgSend(v25, "notificationAuthorizationString:", CFSTR("NOTIFICATIONS_TITLE_GENERIC"));
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      title = self->_title;
      self->_title = v7;

      v9 = CFSTR("NOTIFICATIONS_BODY_GENERIC");
      goto LABEL_8;
    case 1uLL:
      objc_msgSend(v25, "notificationAuthorizationString:", CFSTR("NOTIFICATIONS_TITLE_APPLE_CARD"));
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      v11 = self->_title;
      self->_title = v10;

      v9 = CFSTR("NOTIFICATIONS_BODY_APPLE_CARD");
      goto LABEL_8;
    case 2uLL:
      objc_msgSend(v25, "notificationAuthorizationString:", CFSTR("NOTIFICATIONS_TITLE_TRANSIT"));
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      v13 = self->_title;
      self->_title = v12;

      v9 = CFSTR("NOTIFICATIONS_BODY_TRANSIT");
      goto LABEL_8;
    case 3uLL:
      objc_msgSend(v25, "notificationAuthorizationString:", CFSTR("NOTIFICATIONS_TITLE_IDENTITY"));
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      v15 = self->_title;
      self->_title = v14;

      v9 = CFSTR("NOTIFICATIONS_BODY_IDENTITY");
      goto LABEL_8;
    case 4uLL:
      objc_msgSend(v25, "notificationAuthorizationString:", CFSTR("NOTIFICATIONS_TITLE_PAYMENT_PASS"));
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      v17 = self->_title;
      self->_title = v16;

      v9 = CFSTR("NOTIFICATIONS_BODY_PAYMENT_PASS");
      goto LABEL_8;
    case 5uLL:
      objc_msgSend(v25, "notificationAuthorizationString:", CFSTR("NOTIFICATIONS_TITLE_BOARDING_PASS"));
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v19 = self->_title;
      self->_title = v18;

      v9 = CFSTR("NOTIFICATIONS_BODY_BOARDING_PASS");
LABEL_8:
      objc_msgSend(v25, "notificationAuthorizationString:", v9);
      v20 = (NSString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 6uLL:
      PKLocalizedCocoonString(CFSTR("ENROLL_IN_NOTIFICATIONS_TITLE"));
      v23 = (NSString *)objc_claimAutoreleasedReturnValue();
      v24 = self->_title;
      self->_title = v23;

      PKLocalizedCocoonString(CFSTR("ENROLL_IN_NOTIFICATIONS_BODY"));
      v20 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      body = self->_body;
      self->_body = v20;

      break;
    default:
      break;
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  self->_cgExplanationImage = (CGImage *)objc_msgSend(v25, "notificationAuthorizationImageForLocale:", v22);

  os_unfair_lock_unlock(&self->_contentLock);
}

- (unint64_t)_preflightStatus
{
  os_unfair_lock_s *p_statusLock;
  unint64_t preflightStatus;

  p_statusLock = &self->_statusLock;
  os_unfair_lock_lock(&self->_statusLock);
  preflightStatus = self->_preflightStatus;
  os_unfair_lock_unlock(p_statusLock);
  return preflightStatus;
}

- (void)_setPreflightStatus:(unint64_t)a3
{
  os_unfair_lock_s *p_statusLock;

  p_statusLock = &self->_statusLock;
  os_unfair_lock_lock(&self->_statusLock);
  self->_preflightStatus = a3;
  os_unfair_lock_unlock(p_statusLock);
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  PKUserNotificationAuthorizationController *controller;
  _QWORD v5[5];

  -[PKUserNotificationAuthorizationExplanationViewController _reportContinueButtonTapped](self, "_reportContinueButtonTapped", a3);
  -[PKUserNotificationAuthorizationExplanationViewController _reportNotificationPromptDidAppear](self, "_reportNotificationPromptDidAppear");
  self->_isPresentingNotificationAuthorizationPrompt = 1;
  controller = self->_controller;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __93__PKUserNotificationAuthorizationExplanationViewController_explanationViewDidSelectContinue___block_invoke;
  v5[3] = &unk_1E3E65130;
  v5[4] = self;
  -[PKUserNotificationAuthorizationController requestNotificationAuthorizationWithCompletion:](controller, "requestNotificationAuthorizationWithCompletion:", v5);
}

void __93__PKUserNotificationAuthorizationExplanationViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __93__PKUserNotificationAuthorizationExplanationViewController_explanationViewDidSelectContinue___block_invoke_2;
  v2[3] = &unk_1E3E64C10;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

uint64_t __93__PKUserNotificationAuthorizationExplanationViewController_explanationViewDidSelectContinue___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];
  char v4;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __93__PKUserNotificationAuthorizationExplanationViewController_explanationViewDidSelectContinue___block_invoke_3;
  v3[3] = &unk_1E3E64C10;
  v3[4] = v1;
  v4 = *(_BYTE *)(a1 + 40);
  return objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, v3);
}

uint64_t __93__PKUserNotificationAuthorizationExplanationViewController_explanationViewDidSelectContinue___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_reportNotificationAuthorizationButtonTapped:", *(unsigned __int8 *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1136) = 0;
  return result;
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  -[PKUserNotificationAuthorizationExplanationViewController _reportNotNowButtonTapped](self, "_reportNotNowButtonTapped", a3);
  -[PKUserNotificationAuthorizationExplanationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_beginReportingIfNecessary
{
  if (!self->_didBeginWalletSettingsSubject && self->_referralSource == (NSString *)*MEMORY[0x1E0D68E80])
  {
    self->_didBeginWalletSettingsSubject = 1;
    objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", *MEMORY[0x1E0D69940]);
  }
}

- (void)_endReportingIfNecessary
{
  if (self->_referralSource == (NSString *)*MEMORY[0x1E0D68E80])
    objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", *MEMORY[0x1E0D69940]);
}

- (void)_reportViewDidAppear
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v6, "setObject:forKey:", *MEMORY[0x1E0D68C50], *MEMORY[0x1E0D68AA0]);
  objc_msgSend(v6, "setObject:forKey:", *MEMORY[0x1E0D68E98], *MEMORY[0x1E0D68F50]);
  objc_msgSend(v6, "safelySetObject:forKey:", self->_productType, *MEMORY[0x1E0D69028]);
  objc_msgSend(v6, "safelySetObject:forKey:", self->_referralSource, *MEMORY[0x1E0D693B0]);
  v3 = (void *)MEMORY[0x1E0D66A58];
  v4 = *MEMORY[0x1E0D69940];
  v5 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v3, "subject:sendEvent:", v4, v5);

}

- (void)_reportNotificationPromptDidAppear
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D66A58];
  v3 = *MEMORY[0x1E0D69940];
  v4 = *MEMORY[0x1E0D68F50];
  v7[0] = *MEMORY[0x1E0D68AA0];
  v7[1] = v4;
  v5 = *MEMORY[0x1E0D68E70];
  v8[0] = *MEMORY[0x1E0D68C50];
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subject:sendEvent:", v3, v6);

}

- (void)_reportContinueButtonTapped
{
  id v2;

  -[PKUserNotificationAuthorizationExplanationViewController _analyticsPartialEventDictionaryWithButtonTag:pageTag:](self, "_analyticsPartialEventDictionaryWithButtonTag:pageTag:", *MEMORY[0x1E0D68958], *MEMORY[0x1E0D68E98]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D66A58], "subject:sendEvent:", *MEMORY[0x1E0D69940], v2);

}

- (void)_reportNotNowButtonTapped
{
  id v2;

  -[PKUserNotificationAuthorizationExplanationViewController _analyticsPartialEventDictionaryWithButtonTag:pageTag:](self, "_analyticsPartialEventDictionaryWithButtonTag:pageTag:", *MEMORY[0x1E0D68E68], *MEMORY[0x1E0D68E98]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D66A58], "subject:sendEvent:", *MEMORY[0x1E0D69940], v2);

}

- (void)_reportNotificationAuthorizationButtonTapped:(BOOL)a3
{
  _QWORD *v3;
  id v4;

  v3 = (_QWORD *)MEMORY[0x1E0D68750];
  if (!a3)
    v3 = (_QWORD *)MEMORY[0x1E0D68A40];
  -[PKUserNotificationAuthorizationExplanationViewController _analyticsPartialEventDictionaryWithButtonTag:pageTag:](self, "_analyticsPartialEventDictionaryWithButtonTag:pageTag:", *v3, *MEMORY[0x1E0D68E70]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D66A58], "subject:sendEvent:", *MEMORY[0x1E0D69940], v4);

}

- (id)_analyticsPartialEventDictionaryWithButtonTag:(id)a3 pageTag:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68B18], *MEMORY[0x1E0D68AA0]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D68858]);

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D68F50]);
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

- (id)nextStepHandler
{
  return self->_nextStepHandler;
}

- (void)setNextStepHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1144);
}

- (BOOL)isPresentingNotificationAuthorizationPrompt
{
  return self->_isPresentingNotificationAuthorizationPrompt;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_nextStepHandler, 0);
  objc_storeStrong((id *)&self->_notNowString, 0);
  objc_storeStrong((id *)&self->_continueString, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_referralSource, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
