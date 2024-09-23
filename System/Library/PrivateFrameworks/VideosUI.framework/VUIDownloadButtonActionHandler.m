@implementation VUIDownloadButtonActionHandler

- (VUIDownloadButtonActionHandler)initWithViewModel:(id)a3
{
  id v5;
  VUIDownloadButtonActionHandler *v6;
  VUIDownloadButtonActionHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIDownloadButtonActionHandler;
  v6 = -[VUIDownloadButtonActionHandler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_viewModel, a3);

  return v7;
}

- (void)performAction:(BOOL)a3 confirmBeforeStopDownloading:(BOOL)a4
{
  -[VUIDownloadButtonActionHandler performAction:confirmBeforeStopDownloading:prefer3DOrImmersiveDownload:](self, "performAction:confirmBeforeStopDownloading:prefer3DOrImmersiveDownload:", a3, a4, 0);
}

- (void)performAction:(BOOL)a3 confirmBeforeStopDownloading:(BOOL)a4 prefer3DOrImmersiveDownload:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void (**v30)(void);
  uint8_t v31[8];
  const __CFString *v32;
  void *v33;
  _QWORD v34[4];
  _QWORD v35[5];

  v5 = a5;
  v6 = a4;
  v35[4] = *MEMORY[0x1E0C80C00];
  if (!-[VUIDownloadButtonActionHandler ignoreDownloadActionIfInRetailDemoMode](self, "ignoreDownloadActionIfInRetailDemoMode"))
  {
    if (a3)
    {
      v9 = CFSTR("LibraryButton_Download");
    }
    else
    {
      -[VUIDownloadButtonActionHandler viewModel](self, "viewModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "videosPlayable");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "canonicalID");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = CFSTR("BannerButton_Download");
      if (v12)
        v14 = (__CFString *)v12;
      v9 = v14;

    }
    v34[0] = CFSTR("actionType");
    v34[1] = CFSTR("targetType");
    v35[0] = CFSTR("Download");
    v35[1] = CFSTR("button");
    v35[2] = v9;
    v34[2] = CFSTR("targetId");
    v34[3] = CFSTR("actionDetails");
    v32 = CFSTR("CurrentState");
    -[VUIDownloadButtonActionHandler viewModel](self, "viewModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "downloadStateStringValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "recordClick:", v18);

    -[VUIDownloadButtonActionHandler viewModel](self, "viewModel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "downloadType");

    if (v21 == 1)
    {
      -[VUIDownloadButtonActionHandler _presentSeasonsDownloadList](self, "_presentSeasonsDownloadList");
    }
    else
    {
      -[VUIDownloadButtonActionHandler viewModel](self, "viewModel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "downloadType");

      if (v23 == 2)
      {
        -[VUIDownloadButtonActionHandler _handleSeasonsDownload](self, "_handleSeasonsDownload");
      }
      else
      {
        -[VUIDownloadButtonActionHandler viewModel](self, "viewModel");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "downloadState");

        switch(v25)
        {
          case 0:
          case 3:
            -[VUIDownloadButtonActionHandler viewModel](self, "viewModel");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "downloadExpirationDate");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27 && (objc_msgSend(v27, "vui_isInThePast") & 1) != 0)
              -[VUIDownloadButtonActionHandler _askUserAndDeleteIfNeeded](self, "_askUserAndDeleteIfNeeded");
            else
              -[VUIDownloadButtonActionHandler _startDownloadIfPossibleRemovingFromUIOnCancellationOrFailure:prefer3DOrImmersiveDownload:](self, "_startDownloadIfPossibleRemovingFromUIOnCancellationOrFailure:prefer3DOrImmersiveDownload:", 1, v5);

            break;
          case 1:
          case 2:
            if (!v6)
            {
              -[VUIDownloadButtonActionHandler acknowledgementDownloadCancelledBlock](self, "acknowledgementDownloadCancelledBlock");
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              if (v29)
              {
                -[VUIDownloadButtonActionHandler acknowledgementDownloadCancelledBlock](self, "acknowledgementDownloadCancelledBlock");
                v30 = (void (**)(void))objc_claimAutoreleasedReturnValue();
                v30[2]();

              }
              -[VUIDownloadButtonActionHandler viewModel](self, "viewModel");
              v28 = objc_claimAutoreleasedReturnValue();
              -[NSObject stopDownload](v28, "stopDownload");
              goto LABEL_25;
            }
            -[VUIDownloadButtonActionHandler _showDownloadingInfoDialog](self, "_showDownloadingInfoDialog");
            break;
          case 4:
            if (+[VUIUtilities isInRetailDemoMode](VUIUtilities, "isInRetailDemoMode"))
            {
              VUIDefaultLogObject();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v31 = 0;
                _os_log_impl(&dword_1D96EE000, v28, OS_LOG_TYPE_DEFAULT, "application running in demo mode so not showing delete menu from download button.", v31, 2u);
              }
LABEL_25:

            }
            else
            {
              -[VUIDownloadButtonActionHandler _askUserAndDeleteIfNeeded](self, "_askUserAndDeleteIfNeeded");
            }
            break;
          default:
            break;
        }
      }
    }

  }
}

- (BOOL)ignoreDownloadActionIfInRetailDemoMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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

  if (+[VUIUtilities isInRetailDemoMode](VUIUtilities, "isInRetailDemoMode"))
  {
    -[VUIDownloadButtonActionHandler viewModel](self, "viewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "videosPlayable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[VUIDownloadButtonActionHandler viewModel](self, "viewModel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "videosPlayable");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "channelName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(v6, "length");
      LOBYTE(v4) = v7 != 0;
      if (v7)
      {
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringForKey:", CFSTR("TV.StoreDemo.DownloadAlertTitle"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIDownloadButtonActionHandler _localize:token:value:](self, "_localize:token:value:", v9, CFSTR("channel"), v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:", CFSTR("TV.StoreDemo.DownloadAlertDescription"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIDownloadButtonActionHandler _localize:token:value:](self, "_localize:token:value:", v12, CFSTR("channel"), v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        +[VUIAlertController vui_alertControllerWithTitle:message:preferredStyle:](VUIAlertController, "vui_alertControllerWithTitle:message:preferredStyle:", v10, v13, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringForKey:", CFSTR("OK"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v16, 1, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "vui_addAction:", v17);
        +[VUIApplicationRouter topPresentedViewController](VUIApplicationRouter, "topPresentedViewController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "presentViewController:animated:completion:", v14, 1, 0);

      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (void)_askUserAndDeleteIfNeeded
{
  void *v3;
  int v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  __CFString *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void (**v51)(_QWORD, _QWORD);
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  id location;

  +[VUIAlertController vui_alertControllerWithTitle:message:preferredStyle:](VUIAlertController, "vui_alertControllerWithTitle:message:preferredStyle:", &stru_1E9FF3598, &stru_1E9FF3598, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(MEMORY[0x1E0DC69D0], "isPad");
  v5 = CFSTR("REMOVE_DOWNLOAD_ALERT_TITLE_IPHONE");
  if (v4)
    v5 = CFSTR("REMOVE_DOWNLOAD_ALERT_TITLE_IPAD");
  v6 = v5;
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:", v6);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:", CFSTR("CANCEL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v9, 1, 0);
  v10 = objc_claimAutoreleasedReturnValue();

  v53 = (void *)v10;
  objc_msgSend(v3, "vui_addAction:", v10);
  objc_initWeak(&location, self);
  if (-[VUIDownloadButtonActionHandler _shouldShowRenewalOption](self, "_shouldShowRenewalOption"))
  {
    -[VUIDownloadButtonActionHandler viewModel](self, "viewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "downloadExpirationDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
LABEL_22:

      goto LABEL_23;
    }
    if (objc_msgSend(v12, "vui_isInThePast"))
    {
      if ((objc_msgSend(MEMORY[0x1E0DC69D0], "isVision") & 1) != 0)
      {
        v13 = CFSTR("DOWNLOAD_RENEW_TO_KEEP_THIS_DOWNLOAD_MESSAGE_VISION_PRO");
      }
      else
      {
        v20 = objc_msgSend(MEMORY[0x1E0DC69D0], "isPad");
        v13 = CFSTR("DOWNLOAD_RENEW_TO_KEEP_THIS_DOWNLOAD_MESSAGE_IPHONE");
        if (v20)
          v13 = CFSTR("DOWNLOAD_RENEW_TO_KEEP_THIS_DOWNLOAD_MESSAGE_IPAD");
      }
      v19 = v13;

      -[VUIDownloadButtonActionHandler viewModel](self, "viewModel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "brandName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x1E0CB3940];
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:", v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithValidatedFormat:validFormatSpecifiers:error:", v24, CFSTR("%@"), 0, v15);
      v25 = objc_claimAutoreleasedReturnValue();

      -[VUIDownloadButtonActionHandler _renewalAlertAction](self, "_renewalAlertAction");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "vui_addAction:", v18);
      v54 = (void *)v25;
    }
    else
    {
      -[VUIDownloadButtonActionHandler viewModel](self, "viewModel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "brandID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v15, "length"))
      {
LABEL_21:

        goto LABEL_22;
      }
      +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "downloadConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "blacklistedEarlyRenewalBrands");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18 && (objc_msgSend(v18, "containsObject:", v15) & 1) != 0)
      {
        v19 = v6;
      }
      else
      {
        if ((objc_msgSend(MEMORY[0x1E0DC69D0], "isVision") & 1) != 0)
        {
          v26 = CFSTR("DOWNLOAD_RENEW_TO_KEEP_THIS_DOWNLOAD_MESSAGE_VISION_PRO");
        }
        else
        {
          v27 = objc_msgSend(MEMORY[0x1E0DC69D0], "isPad");
          v26 = CFSTR("DOWNLOAD_RENEW_TO_KEEP_THIS_DOWNLOAD_MESSAGE_IPHONE");
          if (v27)
            v26 = CFSTR("DOWNLOAD_RENEW_TO_KEEP_THIS_DOWNLOAD_MESSAGE_IPAD");
        }
        v19 = v26;

        -[VUIDownloadButtonActionHandler viewModel](self, "viewModel");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "brandName");
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = (void *)MEMORY[0x1E0CB3940];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "localizedStringForKey:", v19);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringWithValidatedFormat:validFormatSpecifiers:error:", v31, CFSTR("%@"), 0, v52);
        v32 = objc_claimAutoreleasedReturnValue();

        -[VUIDownloadButtonActionHandler _renewalAlertAction](self, "_renewalAlertAction");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "vui_addAction:", v33);

        v54 = (void *)v32;
      }
    }

    v6 = v19;
    goto LABEL_21;
  }
LABEL_23:
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "localizedStringForKey:", CFSTR("REMOVE_DOWNLOAD"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __59__VUIDownloadButtonActionHandler__askUserAndDeleteIfNeeded__block_invoke;
  v55[3] = &unk_1E9FA1028;
  objc_copyWeak(&v56, &location);
  +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v35, 2, v55);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "vui_addAction:", v36);
  objc_msgSend(v3, "setVuiTitle:", v54);
  -[VUIDownloadButtonActionHandler parentView](self, "parentView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bounds");
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  objc_msgSend(v3, "popoverPresentationController");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setSourceView:", v37);
  objc_msgSend(v46, "setSourceRect:", v39, v41, v43, v45);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_153);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setBackgroundColor:", v47);
  objc_msgSend(v46, "setPermittedArrowDirections:", 15);
  -[VUIDownloadButtonActionHandler topPresentedViewController](self, "topPresentedViewController");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadButtonActionHandler setDeleteConfirmationAlertController:](self, "setDeleteConfirmationAlertController:", v3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addObserver:selector:name:object:", self, sel__handleAppDidEnterBackgroundNotification_, *MEMORY[0x1E0DC6AB8], 0);

  if (_os_feature_enabled_impl()
    && (-[VUIDownloadButtonActionHandler presentAlertBlock](self, "presentAlertBlock"),
        v50 = (void *)objc_claimAutoreleasedReturnValue(),
        v50,
        v50))
  {
    -[VUIDownloadButtonActionHandler presentAlertBlock](self, "presentAlertBlock");
    v51 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v51)[2](v51, v3);

  }
  else
  {
    objc_msgSend(v3, "vui_presentAlertFromPresentingController:animated:completion:", v48, 1, 0);
  }

  objc_destroyWeak(&v56);
  objc_destroyWeak(&location);

}

void __59__VUIDownloadButtonActionHandler__askUserAndDeleteIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void (**v3)(void);
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "acknowledgementDownloadDeletedBlock");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(v5, "acknowledgementDownloadDeletedBlock");
      v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v3[2]();

    }
    objc_msgSend(v5, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deleteDownload");

    WeakRetained = v5;
  }

}

id __59__VUIDownloadButtonActionHandler__askUserAndDeleteIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_showDownloadingInfoDialog
{
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
  void (**v13)(_QWORD, _QWORD);
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  objc_initWeak(&location, self);
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:", CFSTR("DOWNLOADING"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIAlertController vui_alertControllerWithTitle:message:preferredStyle:](VUIAlertController, "vui_alertControllerWithTitle:message:preferredStyle:", v4, &stru_1E9FF3598, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:", CFSTR("REMOVE_DOWNLOAD"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __60__VUIDownloadButtonActionHandler__showDownloadingInfoDialog__block_invoke;
  v17 = &unk_1E9FA1028;
  objc_copyWeak(&v18, &location);
  +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v7, 2, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "vui_addAction:", v8, v14, v15, v16, v17);
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:", CFSTR("CANCEL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v10, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "vui_addAction:", v11);
  if (_os_feature_enabled_impl()
    && (-[VUIDownloadButtonActionHandler presentAlertBlock](self, "presentAlertBlock"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    -[VUIDownloadButtonActionHandler presentAlertBlock](self, "presentAlertBlock");
    v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v13)[2](v13, v5);
  }
  else
  {
    -[VUIDownloadButtonActionHandler topPresentedViewController](self, "topPresentedViewController");
    v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "vui_presentAlertFromPresentingController:animated:completion:", v13, 1, 0);
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __60__VUIDownloadButtonActionHandler__showDownloadingInfoDialog__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void (**v3)(void);
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "acknowledgementDownloadDeletedBlock");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(v5, "acknowledgementDownloadDeletedBlock");
      v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v3[2]();

    }
    objc_msgSend(v5, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deleteDownload");

    WeakRetained = v5;
  }

}

- (id)_renewalAlertAction
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  char v13;
  id location;

  -[VUIDownloadButtonActionHandler viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsManualDownloadRenewal");

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = CFSTR("RENEW_DOWNLOAD");
  else
    v7 = CFSTR("DOWNLOAD_AGAIN_BUTTON_TITLE");
  objc_msgSend(v5, "localizedStringForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__VUIDownloadButtonActionHandler__renewalAlertAction__block_invoke;
  v11[3] = &unk_1E9FA4A48;
  objc_copyWeak(&v12, &location);
  v13 = v4;
  +[VUIAlertAction vui_actionWithTitle:style:handler:](VUIAlertAction, "vui_actionWithTitle:style:handler:", v8, 0, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v9;
}

void __53__VUIDownloadButtonActionHandler__renewalAlertAction__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(WeakRetained, "viewModel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "fetchNewKeysForDownloadedVideo");

    }
    else
    {
      objc_msgSend(WeakRetained, "_startDownloadIfPossibleRemovingFromUIOnCancellationOrFailure:prefer3DOrImmersiveDownload:", 0, 1);
    }
    WeakRetained = v4;
  }

}

- (BOOL)_shouldShowRenewalOption
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  int v6;
  BOOL v7;

  -[VUIDownloadButtonActionHandler viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "renewsOfflineKeysAutomatically");
  objc_msgSend(v2, "downloadExpirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "availabilityEndDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = objc_msgSend(v4, "vui_isInThePast");
    if (!v3)
      goto LABEL_6;
  }
  else
  {
    v6 = 0;
    if (!v3)
      goto LABEL_6;
  }
  if (!v6)
  {
LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
LABEL_6:
  if (v5 && !objc_msgSend(v5, "vui_isInTheFuture"))
    goto LABEL_9;
  v7 = 1;
LABEL_10:

  return v7;
}

- (void)_startDownloadIfPossibleRemovingFromUIOnCancellationOrFailure:(BOOL)a3 prefer3DOrImmersiveDownload:(BOOL)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;
  BOOL v15;
  id location;

  -[VUIDownloadButtonActionHandler presentingViewController](self, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    goto LABEL_4;
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "controllerPresenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_4;
  +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
LABEL_4:
    objc_initWeak(&location, self);
    -[VUIDownloadButtonActionHandler viewModel](self, "viewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __124__VUIDownloadButtonActionHandler__startDownloadIfPossibleRemovingFromUIOnCancellationOrFailure_prefer3DOrImmersiveDownload___block_invoke;
    v12[3] = &unk_1E9FA4A70;
    objc_copyWeak(&v13, &location);
    v14 = a3;
    v15 = a4;
    objc_msgSend(v11, "preflightPresentingViewController:completion:", v7, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
}

void __124__VUIDownloadButtonActionHandler__startDownloadIfPossibleRemovingFromUIOnCancellationOrFailure_prefer3DOrImmersiveDownload___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained;
  void *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    v10 = WeakRetained;
    objc_msgSend(WeakRetained, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startDownloadAllowingCellular:shouldMarkAsDeletedOnCancellationOrFailure:quality:prefer3DOrImmersiveDownload:", a3, *(unsigned __int8 *)(a1 + 40), a4, *(unsigned __int8 *)(a1 + 41));

    WeakRetained = v10;
  }

}

- (void)_checkForAccountSignInWithCompletionHandler:(id)a3
{
  void (**v3)(id, uint64_t);
  NSObject *v4;
  _QWORD v5[4];
  void (**v6)(id, uint64_t);
  uint8_t buf[16];

  v3 = (void (**)(id, uint64_t))a3;
  if (+[VUIAuthenticationManager userHasActiveAccount](VUIAuthenticationManager, "userHasActiveAccount"))
  {
    v3[2](v3, 1);
  }
  else
  {
    VUIDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "User not logged in, asking to Auth before downloading", buf, 2u);
    }

    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __78__VUIDownloadButtonActionHandler__checkForAccountSignInWithCompletionHandler___block_invoke;
    v5[3] = &unk_1E9F99C68;
    v6 = v3;
    +[VUIAuthenticationManager requestAuthenticationAlwaysPrompt:withCompletionHandler:](VUIAuthenticationManager, "requestAuthenticationAlwaysPrompt:withCompletionHandler:", 1, v5);

  }
}

void __78__VUIDownloadButtonActionHandler__checkForAccountSignInWithCompletionHandler___block_invoke(uint64_t a1)
{
  _QWORD block[2];
  uint64_t (*v2)(uint64_t);
  void *v3;
  id v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v2 = __78__VUIDownloadButtonActionHandler__checkForAccountSignInWithCompletionHandler___block_invoke_2;
  v3 = &unk_1E9F98E68;
  v4 = *(id *)(a1 + 32);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v2((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __78__VUIDownloadButtonActionHandler__checkForAccountSignInWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_presentSeasonsDownloadList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;

  -[VUIDownloadButtonActionHandler viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "seasonsMetadata");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "count"))
  {
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewControllerWithSeasonsMetadata:", v17);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setModalPresentationStyle:", 7);
    -[VUIDownloadButtonActionHandler parentView](self, "parentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v5, "popoverPresentationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSourceView:", v6);
    objc_msgSend(v15, "setSourceRect:", v8, v10, v12, v14);
    objc_msgSend(v15, "setPermittedArrowDirections:", 0);
    objc_msgSend(v15, "setPopoverLayoutMargins:", 50.0, *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), 50.0);
    -[VUIDownloadButtonActionHandler topPresentedViewController](self, "topPresentedViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_1F02C5730))
      objc_msgSend(v15, "setDelegate:", v5);
    objc_msgSend(v16, "presentViewController:animated:completion:", v5, 1, 0);

  }
}

- (void)_handleSeasonsDownload
{
  void *v3;
  uint64_t v4;

  -[VUIDownloadButtonActionHandler viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "downloadState");

  if (v4 == 3 || !v4)
    -[VUIDownloadButtonActionHandler _startDownloadsForSeasonEpisodes](self, "_startDownloadsForSeasonEpisodes");
}

- (void)_startDownloadsForSeasonEpisodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11[2];
  id location;

  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaDownloadQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "playablesFetcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadButtonActionHandler viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "seasonsMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_initWeak(&location, self);
    v9 = (void *)objc_msgSend(v8, "episodeCount");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__VUIDownloadButtonActionHandler__startDownloadsForSeasonEpisodes__block_invoke;
    v10[3] = &unk_1E9FA4A98;
    objc_copyWeak(v11, &location);
    v11[1] = v9;
    objc_msgSend(v5, "fetchSeasonPlayables:forActionHandler:completionBlock:", v8, self, v10);
    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }

}

void __66__VUIDownloadButtonActionHandler__startDownloadsForSeasonEpisodes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  VUIUniversalCollectionAssetController *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v5 = -[VUIUniversalCollectionAssetController initWithPlayables:completionCount:]([VUIUniversalCollectionAssetController alloc], "initWithPlayables:completionCount:", v7, *(_QWORD *)(a1 + 40));
      objc_msgSend(WeakRetained, "viewModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAssetController:", v5);

      objc_msgSend(WeakRetained, "_startDownloadIfPossibleRemovingFromUIOnCancellationOrFailure:prefer3DOrImmersiveDownload:", 1, 1);
    }

  }
}

- (void)_handleAppDidEnterBackgroundNotification:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC6AB8], 0);

  -[VUIDownloadButtonActionHandler _dismissConfirmationAlertController](self, "_dismissConfirmationAlertController");
}

- (void)_dismissConfirmationAlertController
{
  void *v3;
  void *v4;

  -[VUIDownloadButtonActionHandler deleteConfirmationAlertController](self, "deleteConfirmationAlertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUIDownloadButtonActionHandler deleteConfirmationAlertController](self, "deleteConfirmationAlertController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "vui_dismissViewControllerAnimated:completion:", 1, 0);

    -[VUIDownloadButtonActionHandler setDeleteConfirmationAlertController:](self, "setDeleteConfirmationAlertController:", 0);
  }
}

- (id)_localize:(id)a3 token:(id)a4 value:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = a5;
  v9 = a3;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("@@%@@@"), a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)topPresentedViewController
{
  void *v2;

  -[VUIDownloadButtonActionHandler presentingViewController](self, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[VUIApplicationRouter topPresentedViewController](VUIApplicationRouter, "topPresentedViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (VUIDownloadButtonViewModel)viewModel
{
  return self->_viewModel;
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (UIView)parentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_parentView);
}

- (void)setParentView:(id)a3
{
  objc_storeWeak((id *)&self->_parentView, a3);
}

- (id)acknowledgementDownloadDeletedBlock
{
  return self->_acknowledgementDownloadDeletedBlock;
}

- (void)setAcknowledgementDownloadDeletedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)presentAlertBlock
{
  return self->_presentAlertBlock;
}

- (void)setPresentAlertBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)acknowledgementDownloadCancelledBlock
{
  return self->_acknowledgementDownloadCancelledBlock;
}

- (void)setAcknowledgementDownloadCancelledBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (VUIAlertController)deleteConfirmationAlertController
{
  return self->_deleteConfirmationAlertController;
}

- (void)setDeleteConfirmationAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_deleteConfirmationAlertController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteConfirmationAlertController, 0);
  objc_storeStrong(&self->_acknowledgementDownloadCancelledBlock, 0);
  objc_storeStrong(&self->_presentAlertBlock, 0);
  objc_storeStrong(&self->_acknowledgementDownloadDeletedBlock, 0);
  objc_destroyWeak((id *)&self->_parentView);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
