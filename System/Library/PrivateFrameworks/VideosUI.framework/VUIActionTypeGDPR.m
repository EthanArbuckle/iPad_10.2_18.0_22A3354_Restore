@implementation VUIActionTypeGDPR

- (VUIActionTypeGDPR)initWithContextData:(id)a3 appContext:(id)a4
{
  id v7;
  id v8;
  VUIActionTypeGDPR *v9;
  VUIActionTypeGDPR *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VUIActionTypeGDPR;
  v9 = -[VUIActionTypeGDPR init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contextData, a3);
    objc_storeWeak((id *)&v10->_appContext, v8);
  }

  return v10;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  VUIActionTypeGDPR *v19;
  id v20;
  id v21;
  id location;
  _QWORD v23[5];
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = CFSTR("targetId");
  v23[1] = CFSTR("targetType");
  v24[0] = CFSTR("continue");
  v24[1] = CFSTR("button");
  v23[2] = CFSTR("actionType");
  v23[3] = CFSTR("dialogId");
  v24[2] = CFSTR("gdprConsent");
  v24[3] = CFSTR("GDPR");
  v23[4] = CFSTR("dialogType");
  v24[4] = CFSTR("GDPR");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recordClick:", v12);

  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "forceGDPRConsentStatus:", 1);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "vui_postNotificationName:object:userInfo:", CFSTR("VUIGDPRUserDidConsentNotification"), 0, 0);

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66__VUIActionTypeGDPR_performWithTargetResponder_completionHandler___block_invoke;
  v17[3] = &unk_1E9F9C1B0;
  v15 = v10;
  v18 = v15;
  v19 = self;
  v16 = v7;
  v20 = v16;
  objc_copyWeak(&v21, &location);
  +[VUIGDPRPresentationManager acceptGDPRAndSyncWithServers:](VUIGDPRPresentationManager, "acceptGDPRAndSyncWithServers:", v17);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&location);
}

void __66__VUIActionTypeGDPR_performWithTargetResponder_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id *WeakRetained;
  id *v6;
  id v7;
  _QWORD block[2];
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  uint64_t v12;
  id v13;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v9 = __66__VUIActionTypeGDPR_performWithTargetResponder_completionHandler___block_invoke_2;
  v10 = &unk_1E9F99778;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v11 = v2;
  v12 = v3;
  v13 = v4;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v9((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained(WeakRetained + 2);
    +[VUIJSNotificationCenter showSignupAlertPushNotificationWithAppContext:](VUIJSNotificationCenter, "showSignupAlertPushNotificationWithAppContext:", v7);

  }
}

void __66__VUIActionTypeGDPR_performWithTargetResponder_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  id WeakRetained;
  NSObject *v8;
  uint8_t v9[16];
  _QWORD v10[5];
  id v11;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__VUIActionTypeGDPR_performWithTargetResponder_completionHandler___block_invoke_3;
  v10[3] = &unk_1E9F99D58;
  v2 = *(void **)(a1 + 32);
  v10[4] = *(_QWORD *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v10);
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURLHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "openedByDeeplink");

  if ((v5 & 1) == 0)
  {
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIApplicationActionRouter - GDPR Accept Button -- Check if there is any pending offer to spend", v9, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
    +[VUIOfferUtilities fetchAndPresentOffer:sourceEvent:completion:](VUIOfferUtilities, "fetchAndPresentOffer:sourceEvent:completion:", WeakRetained, CFSTR("AppLaunch"), 0);

  }
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v8, &__block_literal_global_41);

}

void __66__VUIActionTypeGDPR_performWithTargetResponder_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openURLHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleDeferredURLWithAppContext:", WeakRetained);

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);

}

uint64_t __66__VUIActionTypeGDPR_performWithTargetResponder_completionHandler___block_invoke_8()
{
  return +[VideosUI initializeGroupActivities](_TtC8VideosUI8VideosUI, "initializeGroupActivities");
}

- (NSDictionary)contextData
{
  return self->_contextData;
}

- (void)setContextData:(id)a3
{
  objc_storeStrong((id *)&self->_contextData, a3);
}

- (VUIAppContext)appContext
{
  return (VUIAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (void)setAppContext:(id)a3
{
  objc_storeWeak((id *)&self->_appContext, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_contextData, 0);
}

@end
