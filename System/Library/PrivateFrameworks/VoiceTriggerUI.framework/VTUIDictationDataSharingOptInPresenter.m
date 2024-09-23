@implementation VTUIDictationDataSharingOptInPresenter

- (id)dataSharingOptInView
{
  VTUISiriDataSharingOptInViewController *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  int v11;
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
  OBWelcomeController *currentWelcomeController;
  VTUISiriDataSharingOptInViewController *v26;
  void *v27;

  v3 = -[VTUISiriDataSharingOptInViewController initWithViewStyle:]([VTUISiriDataSharingOptInViewController alloc], "initWithViewStyle:", 2);
  +[MGWrapper sharedMGWrapper](MGWrapper, "sharedMGWrapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDeviceIPad");

  if (v5)
  {
    -[VTUISiriDataSharingOptInViewController headerView](v3, "headerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("DATA_SHARING_DETAIL_IPAD");
  }
  else
  {
    +[MGWrapper sharedMGWrapper](MGWrapper, "sharedMGWrapper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isDeviceVision");

    -[VTUISiriDataSharingOptInViewController headerView](v3, "headerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v11)
      v9 = CFSTR("DATA_SHARING_DETAIL_VISION");
    else
      v9 = CFSTR("DATA_SHARING_DETAIL_IPHONE");
  }
  objc_msgSend(v7, "uiLocalizedStringForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDetailText:", v12);

  objc_msgSend(MEMORY[0x24BE6E400], "accessoryButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uiLocalizedStringForKey:", CFSTR("DATA_SHARING_DETAIL_LINK"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:forState:", v15, 0);

  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel__userTappedDetailLinkText, 64);
  -[VTUISiriDataSharingOptInViewController headerView](v3, "headerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAccessoryButton:", v13);

  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "uiLocalizedStringForKey:", CFSTR("DATA_SHARING_CONFIRMATION_BUTTON_TITLE"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTitle:forState:", v19, 0);

  objc_msgSend(v17, "addTarget:action:forControlEvents:", self, sel__optInButtonTapped, 64);
  -[VTUISiriDataSharingOptInViewController buttonTray](v3, "buttonTray");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addButton:", v17);

  objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "uiLocalizedStringForKey:", CFSTR("DATA_SHARING_DECLINE_BUTTON_TITLE"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTitle:forState:", v23, 0);

  objc_msgSend(v21, "addTarget:action:forControlEvents:", self, sel__optOutButtonTapped, 64);
  -[VTUISiriDataSharingOptInViewController buttonTray](v3, "buttonTray");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addButton:", v21);

  currentWelcomeController = self->_currentWelcomeController;
  self->_currentWelcomeController = &v3->super;
  v26 = v3;

  -[VTUISiriDataSharingOptInViewController view](v26, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)dataSharingOptInAlertController
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[VTUIDictationDataSharingOptInPresenter dataSharingOptInAlertController]";
    _os_log_impl(&dword_229EF7000, v3, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: Creating dataSharingOptInAlert for dictation", buf, 0xCu);
  }
  v4 = (void *)MEMORY[0x24BEBD3B0];
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uiLocalizedStringForKey:", CFSTR("DATA_SHARING_TITLE_DICTATION"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uiLocalizedStringForKey:", CFSTR("DICTATION_DATA_SHARING_DETAIL_ALERT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, self);
  v10 = (void *)MEMORY[0x24BEBD3A8];
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uiLocalizedStringForKey:", CFSTR("DICTATION_DATA_SHARING_CONFIRMATION_BUTTON_TITLE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __73__VTUIDictationDataSharingOptInPresenter_dataSharingOptInAlertController__block_invoke;
  v28[3] = &unk_24F33DEF8;
  objc_copyWeak(&v29, (id *)buf);
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 0, v28);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v14);

  v15 = (void *)MEMORY[0x24BEBD3A8];
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "uiLocalizedStringForKey:", CFSTR("DICTATION_DATA_SHARING_LEARN_MORE_BUTTON_TITLE"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v13;
  v26[1] = 3221225472;
  v26[2] = __73__VTUIDictationDataSharingOptInPresenter_dataSharingOptInAlertController__block_invoke_2;
  v26[3] = &unk_24F33DEF8;
  objc_copyWeak(&v27, (id *)buf);
  objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 0, v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v18);

  v19 = (void *)MEMORY[0x24BEBD3A8];
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "uiLocalizedStringForKey:", CFSTR("DATA_SHARING_DECLINE_BUTTON_TITLE"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v13;
  v24[1] = 3221225472;
  v24[2] = __73__VTUIDictationDataSharingOptInPresenter_dataSharingOptInAlertController__block_invoke_3;
  v24[3] = &unk_24F33DEF8;
  objc_copyWeak(&v25, (id *)buf);
  objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 0, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v22);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak((id *)buf);
  return v9;
}

void __73__VTUIDictationDataSharingOptInPresenter_dataSharingOptInAlertController__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_optInButtonTapped");

}

void __73__VTUIDictationDataSharingOptInPresenter_dataSharingOptInAlertController__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_learnMoreButtonTapped");

}

void __73__VTUIDictationDataSharingOptInPresenter_dataSharingOptInAlertController__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_optOutButtonTapped");

}

- (id)dataSharingReminderAlertController
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315138;
    v15 = "-[VTUIDictationDataSharingOptInPresenter dataSharingReminderAlertController]";
    _os_log_impl(&dword_229EF7000, v2, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: Creating dataSharingReminderAlert for dictation", (uint8_t *)&v14, 0xCu);
  }
  v3 = (void *)MEMORY[0x24BEBD3B0];
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uiLocalizedStringForKey:", CFSTR("DICTATION_DATA_SHARING_REMINDER_ALERT_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uiLocalizedStringForKey:", CFSTR("DICTATION_DATA_SHARING_REMINDER_ALERT_DETAIL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BEBD3A8];
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uiLocalizedStringForKey:", CFSTR("DICTATION_DATA_SHARING_REMINDER_ALERT_DISMISS"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v12);

  return v8;
}

- (id)dictationDataSharingOptInAlertViewModel
{
  NSObject *v2;
  VTUIDictationDataSharingOptInAlertViewModel *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[VTUIDictationDataSharingOptInPresenter dictationDataSharingOptInAlertViewModel]";
    _os_log_impl(&dword_229EF7000, v2, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: Creating dataSharingOptInAlertViewModel for dictation", (uint8_t *)&v15, 0xCu);
  }
  v3 = objc_alloc_init(VTUIDictationDataSharingOptInAlertViewModel);
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uiLocalizedStringForKey:", CFSTR("DATA_SHARING_TITLE_DICTATION"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIDictationDataSharingOptInAlertViewModel setTitle:](v3, "setTitle:", v5);

  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uiLocalizedStringForKey:", CFSTR("DICTATION_DATA_SHARING_DETAIL_ALERT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIDictationDataSharingOptInAlertViewModel setMessage:](v3, "setMessage:", v7);

  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uiLocalizedStringForKey:", CFSTR("DICTATION_DATA_SHARING_CONFIRMATION_BUTTON_TITLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIDictationDataSharingOptInAlertViewModel setOptInButtonTitle:](v3, "setOptInButtonTitle:", v9);

  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uiLocalizedStringForKey:", CFSTR("DICTATION_DATA_SHARING_LEARN_MORE_BUTTON_TITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIDictationDataSharingOptInAlertViewModel setLearnMoreButtonTitle:](v3, "setLearnMoreButtonTitle:", v11);

  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uiLocalizedStringForKey:", CFSTR("DATA_SHARING_DECLINE_BUTTON_TITLE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIDictationDataSharingOptInAlertViewModel setOptOutButtonTitle:](v3, "setOptOutButtonTitle:", v13);

  return v3;
}

- (id)dictationDataSharingOptInReminderViewModel
{
  return 0;
}

- (void)_userTappedDetailLinkText
{
  id v3;

  if (self->_currentWelcomeController)
  {
    objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.improvesiridictation"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPresentingViewController:", self->_currentWelcomeController);
    objc_msgSend(v3, "present");

  }
}

- (void)_optInButtonTapped
{
  id v3;

  -[VTUIDictationDataSharingOptInPresenter presentationDelegate](self, "presentationDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "optInButtonPressedForPresenter:", self);

}

- (void)_learnMoreButtonTapped
{
  id v3;

  -[VTUIDictationDataSharingOptInPresenter presentationDelegate](self, "presentationDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "learnMoreButtonPressedForPresenter:", self);

}

- (void)_optOutButtonTapped
{
  id v3;

  -[VTUIDictationDataSharingOptInPresenter presentationDelegate](self, "presentationDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "optOutButtonPressedForPresenter:", self);

}

- (VTUIDictationDataSharingOptInPresentationDelegate)presentationDelegate
{
  return (VTUIDictationDataSharingOptInPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (OBWelcomeController)currentWelcomeController
{
  return self->_currentWelcomeController;
}

- (void)setCurrentWelcomeController:(id)a3
{
  objc_storeStrong((id *)&self->_currentWelcomeController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentWelcomeController, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end
