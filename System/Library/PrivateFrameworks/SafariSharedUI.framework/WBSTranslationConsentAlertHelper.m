@implementation WBSTranslationConsentAlertHelper

- (id)consentAlertForType:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  id consentCompletionHandler;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[5];
  _QWORD v28[4];
  id v29[2];
  _QWORD v30[5];
  id location[2];

  v6 = a4;
  objc_initWeak(location, self);
  v7 = (void *)MEMORY[0x1A85D45E4](v6);
  consentCompletionHandler = self->_consentCompletionHandler;
  self->_consentCompletionHandler = v7;

  v9 = (void *)MEMORY[0x1E0CEA2E8];
  WBSTranslationAlertTitleStringForType((void *)a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WBSTranslationDetailStringForType((void *)a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alertControllerWithTitle:message:imageNamed:preferredStyle:", v10, v11, CFSTR("alert-translation"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = CFSTR("ReportTranslationProblemAlert");
  if (!a3)
    v13 = CFSTR("EnableTranslationAlert");
  v14 = v13;
  objc_msgSend(v12, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityIdentifier:", v14);

  v16 = (void *)MEMORY[0x1E0CEA2E0];
  WBSTranslationAlertAllowButtonTitleForType((void *)a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __78__WBSTranslationConsentAlertHelper_consentAlertForType_withCompletionHandler___block_invoke;
  v30[3] = &unk_1E54471C0;
  v30[4] = self;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 0, v30);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0CEA2E0];
  _WBSLocalizedString();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v18;
  v28[1] = 3221225472;
  v28[2] = __78__WBSTranslationConsentAlertHelper_consentAlertForType_withCompletionHandler___block_invoke_2;
  v28[3] = &unk_1E54471E8;
  objc_copyWeak(v29, location);
  v29[1] = (id)a3;
  objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 0, v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0CEA2E0];
  WBSTranslationAlertDeclineButtonTitleForType((void *)a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v18;
  v27[1] = 3221225472;
  v27[2] = __78__WBSTranslationConsentAlertHelper_consentAlertForType_withCompletionHandler___block_invoke_3;
  v27[3] = &unk_1E54471C0;
  v27[4] = self;
  objc_msgSend(v23, "actionWithTitle:style:handler:", v24, 1, v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addAction:", v19);
  objc_msgSend(v12, "addAction:", v22);
  objc_msgSend(v12, "addAction:", v25);
  objc_storeWeak((id *)&self->_currentlyPresentedViewController, v12);

  objc_destroyWeak(v29);
  objc_destroyWeak(location);

  return v12;
}

uint64_t __78__WBSTranslationConsentAlertHelper_consentAlertForType_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callCompletionHandlerIfNeededWithConsent:", 1);
}

void __78__WBSTranslationConsentAlertHelper_consentAlertForType_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v18 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "translationConsentAlertHelperViewControllerToPresentDetailsFrom:", v18);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_alloc(MEMORY[0x1E0D651A8]);
      WBSTranslationLearnMoreTitleForType(*(void **)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v5, "initWithTitle:", v6);

      objc_msgSend(v7, "headerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v9) = 1036831949;
      objc_msgSend(v8, "setTitleHyphenationFactor:", v9);

      objc_msgSend(v7, "presentationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDelegate:", v18);

      WBSTranslationLearnMoreBodyTextForType(*(void **)(a1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSectionWithHeader:content:", 0, v11);

      objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      WBSTranslationAlertAllowButtonTitleForType(*(void **)(a1 + 40));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTitle:forState:", v13, 0);

      objc_msgSend(v12, "addTarget:action:forControlEvents:", v18, sel__enableTranslation_, 64);
      objc_msgSend(v7, "buttonTray");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addButton:", v12);

      objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      WBSTranslationAlertDeclineButtonTitleForType(*(void **)(a1 + 40));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTitle:forState:", v16, 0);

      objc_msgSend(v15, "addTarget:action:forControlEvents:", v18, sel__notNow_, 64);
      objc_msgSend(v7, "buttonTray");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addButton:", v15);

      objc_storeWeak(v18 + 1, v7);
      objc_msgSend(v4, "presentViewController:animated:completion:", v7, 1, 0);

    }
    else
    {
      objc_msgSend(v18, "_callCompletionHandlerIfNeededWithConsent:", 0);
    }

    WeakRetained = v18;
  }

}

uint64_t __78__WBSTranslationConsentAlertHelper_consentAlertForType_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callCompletionHandlerIfNeededWithConsent:", 0);
}

- (void)_callCompletionHandlerIfNeededWithConsent:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void (**consentCompletionHandler)(id, _BOOL8);
  id v7;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentlyPresentedViewController);
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

  consentCompletionHandler = (void (**)(id, _BOOL8))self->_consentCompletionHandler;
  if (consentCompletionHandler)
  {
    consentCompletionHandler[2](consentCompletionHandler, v3);
    v7 = self->_consentCompletionHandler;
    self->_consentCompletionHandler = 0;

  }
}

- (void)_enableTranslation:(id)a3
{
  -[WBSTranslationConsentAlertHelper _callCompletionHandlerIfNeededWithConsent:](self, "_callCompletionHandlerIfNeededWithConsent:", 1);
}

- (void)_notNow:(id)a3
{
  -[WBSTranslationConsentAlertHelper _callCompletionHandlerIfNeededWithConsent:](self, "_callCompletionHandlerIfNeededWithConsent:", 0);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[WBSTranslationConsentAlertHelper _callCompletionHandlerIfNeededWithConsent:](self, "_callCompletionHandlerIfNeededWithConsent:", 0);
}

- (WBSTranslationConsentAlertHelperDelegate)delegate
{
  return (WBSTranslationConsentAlertHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_consentCompletionHandler, 0);
  objc_destroyWeak((id *)&self->_currentlyPresentedViewController);
}

@end
