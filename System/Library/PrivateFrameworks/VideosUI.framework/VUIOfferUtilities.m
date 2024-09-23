@implementation VUIOfferUtilities

+ (void)fetchAndPresentOffer:(id)a3 sourceEvent:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  char v26;
  char v27;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  VUISignpostLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launch.FetchAndPresentOffer", ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:", CFSTR("VUIJSOfferdidStartProcessing"), 0);

  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isFullscreenPlaybackUIBeingShown");

  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "openURLHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isLoadingSharedWatchURL");

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __65__VUIOfferUtilities_fetchAndPresentOffer_sourceEvent_completion___block_invoke;
  v21[3] = &unk_1E9FA3670;
  v26 = v14;
  v27 = v17;
  v22 = v9;
  v23 = v8;
  v24 = v10;
  v25 = a1;
  v18 = v10;
  v19 = v8;
  v20 = v9;
  objc_msgSend(v19, "evaluate:", v21);

}

+ (void)registerDeviceForCommerceOffers
{
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("hasRegisterdDeviceForOffer"));

  if (v3)
  {
    VUIDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_INFO, "VUIOfferUtilities - Already registered the device for offers.", buf, 2u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ams_activeiTunesAccount");
    v4 = objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CFD9E8], "vui_defaultBag");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDA58]), "initWithAccount:bag:", v4, v6);
      objc_msgSend(v7, "perform");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addFinishBlock:", &__block_literal_global_30);

    }
    else
    {
      VUIDefaultLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_INFO, "VUIOfferUtilities - No account is signed in, skipping device offer registration.", v9, 2u);
      }
    }

  }
}

uint64_t __65__VUIOfferUtilities_fetchAndPresentOffer_sourceEvent_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL8 v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t result;
  uint8_t v11[16];
  uint8_t buf[16];
  uint8_t v13[16];
  uint8_t v14[16];

  +[VideosUI handleUpsellPresented:](_TtC8VideosUI8VideosUI, "handleUpsellPresented:", 0);
  v2 = a1[4];
  if (v2)
  {
    +[VUIOpenURLRouterDataSource routerDataSourceWithDict:appContext:](VUIOpenURLRouterDataSource, "routerDataSourceWithDict:appContext:", v2, a1[5]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;
    if (v3)
    {
      +[VideosUI handleUpsellPresented:](_TtC8VideosUI8VideosUI, "handleUpsellPresented:", 1);
      -[NSObject action](v3, "action");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        -[NSObject performWithTargetResponder:completionHandler:](v5, "performWithTargetResponder:completionHandler:", 0, &__block_literal_global_141);
      }
      else
      {
        VUIDefaultLogObject();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_INFO, "Processing valid offer router data source", v14, 2u);
        }

        objc_msgSend((id)objc_opt_class(), "_handleOfferDataSource:appContext:", v3, a1[5]);
      }
    }
    else
    {
      VUIDefaultLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_INFO, "Invalid offer router data source", v13, 2u);
      }
    }

  }
  else
  {
    VUIDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_INFO, "Empty offer router data source", buf, 2u);
    }
    v4 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("VUIJSOfferdidFinishProcessing"), 0);

  VUISignpostLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launch.FetchAndPresentOffer", ", v11, 2u);
  }

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _BOOL8))(result + 16))(result, v4);
  return result;
}

void __65__VUIOfferUtilities_fetchAndPresentOffer_sourceEvent_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  id v9;
  __int128 v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__VUIOfferUtilities_fetchAndPresentOffer_sourceEvent_completion___block_invoke_3;
  block[3] = &unk_1E9FA3620;
  v8 = v3;
  v9 = *(id *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 40);
  v4 = (id)v6;
  v10 = v6;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __65__VUIOfferUtilities_fetchAndPresentOffer_sourceEvent_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  _QWORD aBlock[4];
  id v17;
  __int128 v18;
  _QWORD v19[2];
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("offersInterface"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "hasProperty:", CFSTR("onProcessOffers")))
  {
    if (*(_BYTE *)(a1 + 64))
      v5 = MEMORY[0x1E0C9AAB0];
    else
      v5 = MEMORY[0x1E0C9AAA0];
    v20[0] = CFSTR("isInFullScreenPlayback");
    v20[1] = CFSTR("isBusyLoadingSharedWatch");
    if (*(_BYTE *)(a1 + 65))
      v6 = MEMORY[0x1E0C9AAB0];
    else
      v6 = MEMORY[0x1E0C9AAA0];
    v21[0] = v5;
    v21[1] = v6;
    v20[2] = CFSTR("eventSource");
    v7 = CFSTR("Unknown");
    if (*(_QWORD *)(a1 + 32))
      v7 = *(const __CFString **)(a1 + 32);
    v21[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v8;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __65__VUIOfferUtilities_fetchAndPresentOffer_sourceEvent_completion___block_invoke_2;
    aBlock[3] = &unk_1E9FA3648;
    v17 = *(id *)(a1 + 40);
    v15 = *(_OWORD *)(a1 + 48);
    v9 = (id)v15;
    v18 = v15;
    v10 = _Block_copy(aBlock);
    v19[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v4, "invokeMethod:withArguments:", CFSTR("onProcessOffers"), v11);

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 48);
    if (v13)
      (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:", CFSTR("VUIJSOfferdidFinishProcessing"), 0);

  }
}

void __65__VUIOfferUtilities_fetchAndPresentOffer_sourceEvent_completion___block_invoke_4()
{
  NSObject *v0;
  uint8_t v1[16];

  VUIDefaultLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D96EE000, v0, OS_LOG_TYPE_INFO, "Processed offer action data source", v1, 2u);
  }

}

void __52__VUIOfferUtilities_registerDeviceForCommerceOffers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_INFO, "VUIOfferUtilities - Error running the device offer registration. %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_INFO, "VUIOfferUtilities - Registered the device for offers.", (uint8_t *)&v6, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject setBool:forKey:](v4, "setBool:forKey:", 1, CFSTR("hasRegisterdDeviceForOffer"));
  }

}

+ (void)_handleOfferDataSource:(id)a3 appContext:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  objc_msgSend(a3, "documentDataSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewControllerWithDocumentDataSource:appContext:", v7, v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "uiConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dismissPlaybackAnimated:leaveGroupActivitySession:completion:", 0, 1, 0);

    objc_msgSend(v13, "vui_dismissViewControllerAnimated:completion:", 1, 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[VUIApplicationRouter topPresentedViewController](VUIApplicationRouter, "topPresentedViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUIPresenterController presentViewController:fromViewController:WithConfiguration:completion:](VUIPresenterController, "presentViewController:fromViewController:WithConfiguration:completion:", v9, v15, v10, 0);

    }
    else
    {
      objc_msgSend(v13, "pushViewController:animated:", v9, 0);
    }
  }

}

@end
