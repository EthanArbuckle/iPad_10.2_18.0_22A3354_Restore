@implementation TFBetaAppLaunchPresenter

- (TFBetaAppLaunchPresenter)initWithBundleURL:(id)a3 launchDataProvider:(id)a4 launchScreenSidepack:(id)a5
{
  id v8;
  id v9;
  id v10;
  TFBetaAppLaunchPresenter *v11;
  uint64_t v12;
  NSURL *bundleURL;
  TFImageFetcher *v14;
  TFImageFetcher *imageFetcher;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TFBetaAppLaunchPresenter;
  v11 = -[TFBetaAppLaunchPresenter init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    bundleURL = v11->_bundleURL;
    v11->_bundleURL = (NSURL *)v12;

    objc_storeStrong((id *)&v11->_launchDataProvider, a4);
    objc_storeStrong((id *)&v11->_launchScreen, a5);
    v14 = objc_alloc_init(TFImageFetcher);
    imageFetcher = v11->_imageFetcher;
    v11->_imageFetcher = v14;

  }
  return v11;
}

- (void)update
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  -[TFBetaAppLaunchPresenter launchScreen](self, "launchScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TFBetaAppLaunchPresenter launchScreen](self, "launchScreen");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[TFBetaAppLaunchPresenter _showTestNotesViewWithLaunchScreen:](self, "_showTestNotesViewWithLaunchScreen:", v6);

  }
  else
  {
    -[TFBetaAppLaunchPresenter _showLoading](self, "_showLoading");
    -[TFBetaAppLaunchPresenter launchDataProvider](self, "launchDataProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFBetaAppLaunchPresenter bundleURL](self, "bundleURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __34__TFBetaAppLaunchPresenter_update__block_invoke;
    v7[3] = &unk_24D794AD0;
    v7[4] = self;
    objc_msgSend(v4, "loadLaunchScreenForBundleWithURL:withCompletionHandler:", v5, v7);

  }
}

void __34__TFBetaAppLaunchPresenter_update__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    v8 = v6;
LABEL_9:
    objc_msgSend(v7, "_abortLaunchScreenLoadWithError:", v8);
    goto LABEL_10;
  }
  if (!v5 || (objc_msgSend(v5, "testerNotes"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "generatedLogger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = (void *)objc_opt_class();
      v15 = *(void **)(a1 + 32);
      v16 = v14;
      objc_msgSend(v15, "bundleURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v14;
      v20 = 2114;
      v21 = v17;
      _os_log_impl(&dword_2174E1000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] update: failed to fetch launch screen record, or no tester notes are available", (uint8_t *)&v18, 0x16u);

    }
    v7 = *(void **)(a1 + 32);
    v8 = 0;
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "setLaunchScreen:", v5);
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v10, "launchScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_showTestNotesViewWithLaunchScreen:", v11);

LABEL_10:
}

- (void)showHowToScreen
{
  void *v3;
  id v4;

  -[TFBetaAppLaunchPresenter launchScreen](self, "launchScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TFBetaAppLaunchPresenter launchScreen](self, "launchScreen");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[TFBetaAppLaunchPresenter _showHowToViewWithLaunchScreen:](self, "_showHowToViewWithLaunchScreen:", v4);

  }
}

- (void)openHowToSupportLink
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[TFBetaAppLaunchPresenter launchScreen](self, "launchScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[TFBetaAppLaunchPresenter launchScreen](self, "launchScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "howToScreenshotSupportUrl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "openURL:options:completionHandler:", v5, MEMORY[0x24BDBD1B8], 0);

  }
}

- (void)exitLaunchScreen
{
  id v2;

  -[TFBetaAppLaunchPresenter presenterView](self, "presenterView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissAnimated:", 1);

}

- (void)_showLoading
{
  id v2;

  -[TFBetaAppLaunchPresenter presenterView](self, "presenterView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showLoadingAnimated:", 1);

}

- (void)_showTestNotesViewWithLaunchScreen:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  TFLocalizedString(CFSTR("LAUNCH_BUTTON_NEXT"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[TFBetaAppLaunchPresenter presenterView](self, "presenterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TFLocalizedString(CFSTR("LAUNCH_TITLE_FROM_THE_DEVELOPER"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lockup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  TFLocalizedString(CFSTR("LAUNCH_TEST_NOTES_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "testerNotes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[TFBetaAppLaunchPresenter imageFetcher](self, "imageFetcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = 1;
  objc_msgSend(v5, "showTestNotesWithTitle:lockup:testNotesTitle:testNotesText:primaryButtonTitle:primaryButtonEvent:animated:fetchingOnImageFetcher:", v6, v7, v8, v9, v12, 0, v11, v10);

}

- (void)_showHowToViewWithLaunchScreen:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  +[TFCoreUtils tf_screenshotInstructionImageDict](TFCoreUtils, "tf_screenshotInstructionImageDict", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[TFBetaAppLaunchPresenter presenterView](self, "presenterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TFLocalizedString(CFSTR("LAUNCH_TITLE_SHARE_FEEDBACK"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TFLocalizedString(CFSTR("LAUNCH_SUBTITLE_TAKE_SCREENSHOT_MESSAGE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  TFLocalizedString(CFSTR("LAUNCH_BUTTON_START_TESTING"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  TFLocalizedString(CFSTR("LAUNCH_BUTTON_LEARN_MORE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = 1;
  objc_msgSend(v4, "showHowToWithTitle:subtitle:screenshotImageDict:primaryButtonTitle:primaryButtonEvent:secondaryButtonTitle:secondaryButtonEvent:animated:", v5, v6, v10, v7, 2, v8, 1, v9);

}

- (void)_abortLaunchScreenLoadWithError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generatedLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[TFBetaAppLaunchPresenter bundleURL](self, "bundleURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_2174E1000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] _abortLaunchScreenLoadWithError: error = %@", (uint8_t *)&v11, 0x20u);

  }
  -[TFBetaAppLaunchPresenter exitLaunchScreen](self, "exitLaunchScreen");

}

- (TFBetaAppLaunchPresenterView)presenterView
{
  return (TFBetaAppLaunchPresenterView *)objc_loadWeakRetained((id *)&self->_presenterView);
}

- (void)setPresenterView:(id)a3
{
  objc_storeWeak((id *)&self->_presenterView, a3);
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (TFBetaAppLaunchDataProvider)launchDataProvider
{
  return self->_launchDataProvider;
}

- (TFImageFetcher)imageFetcher
{
  return self->_imageFetcher;
}

- (TFLaunchScreen)launchScreen
{
  return self->_launchScreen;
}

- (void)setLaunchScreen:(id)a3
{
  objc_storeStrong((id *)&self->_launchScreen, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchScreen, 0);
  objc_storeStrong((id *)&self->_imageFetcher, 0);
  objc_storeStrong((id *)&self->_launchDataProvider, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_destroyWeak((id *)&self->_presenterView);
}

@end
