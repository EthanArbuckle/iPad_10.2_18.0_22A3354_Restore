@implementation WBSAppLink

- (WBSAppLink)initWithURL:(id)a3
{
  id v5;
  WBSAppLink *v6;
  WBSAppLink *v7;
  WBSAppLink *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSAppLink;
  v6 = -[WBSAppLink init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_ivarLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_url, a3);
    v8 = v7;
  }

  return v7;
}

- (LSApplicationProxy)synchronousTargetApplicationProxy
{
  void *v2;
  void *v3;

  -[WBSAppLink _synchronouslyFetchAppLinkWithError:](self, "_synchronouslyFetchAppLinkWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetApplicationProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (LSApplicationProxy *)v3;
}

- (BOOL)isAppleNewsLink
{
  WBSAppLink *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[WBSAppLink _synchronouslyFetchAppLinkWithError:](self, "_synchronouslyFetchAppLinkWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetApplicationProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[WBSAppLink _isApplicationProxyAppleNews:](v2, "_isApplicationProxyAppleNews:", v4);

  return (char)v2;
}

+ (void)clearSavedSettings
{
  objc_msgSend(MEMORY[0x1E0CA5838], "removeAllSettingsReturningError:", 0);
}

- (void)decideOpenStrategyWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__WBSAppLink_decideOpenStrategyWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E54415E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WBSAppLink _getAppLinkForBanner:withCompletionHandler:](self, "_getAppLinkForBanner:withCompletionHandler:", 0, v6);

}

uint64_t __54__WBSAppLink_decideOpenStrategyWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_openStrategyForAppLink:", a2));
}

- (void)getAppLinkTargetApplicationBundleIdentifierWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__WBSAppLink_getAppLinkTargetApplicationBundleIdentifierWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5441610;
  v7 = v4;
  v5 = v4;
  -[WBSAppLink _getAppLinkForBanner:withCompletionHandler:](self, "_getAppLinkForBanner:withCompletionHandler:", 0, v6);

}

void __79__WBSAppLink_getAppLinkTargetApplicationBundleIdentifierWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "targetApplicationProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

}

- (int64_t)synchronouslyDecideOpenStrategy
{
  void *v3;
  int64_t v4;

  -[WBSAppLink _synchronouslyFetchAppLinkWithError:](self, "_synchronouslyFetchAppLinkWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WBSAppLink _openStrategyForAppLink:](self, "_openStrategyForAppLink:", v3);

  return v4;
}

- (void)getAppLinkAttributesWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__WBSAppLink_getAppLinkAttributesWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5441638;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WBSAppLink _getAppLinkForBanner:withCompletionHandler:](self, "_getAppLinkForBanner:withCompletionHandler:", 0, v6);

}

void __56__WBSAppLink_getAppLinkAttributesWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v10 = 0;
  v11 = 0;
  v8 = 0;
  v9 = 0;
  objc_msgSend(v3, "_appLink:getAppLinkLabel:name:bundleIdentifier:icon:", a2, &v11, &v10, &v9, &v8);
  v4 = v11;
  v5 = v10;
  v6 = v9;
  v7 = v8;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)getAppLinkLabel:(id *)a3 name:(id *)a4 bundleIdentifier:(id *)a5 icon:(id *)a6
{
  id v11;

  -[WBSAppLink _synchronouslyFetchAppLinkWithError:](self, "_synchronouslyFetchAppLinkWithError:", 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSAppLink _appLink:getAppLinkLabel:name:bundleIdentifier:icon:](self, "_appLink:getAppLinkLabel:name:bundleIdentifier:icon:", v11, a3, a4, a5, a6);

}

- (void)openExternallyWithWebBrowserState:(id)a3 referrerURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  if (a5)
    v10 = a5;
  else
    v10 = &__block_literal_global_1;
  v11 = (void *)MEMORY[0x1A85D45E4](v10);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__WBSAppLink_openExternallyWithWebBrowserState_referrerURL_completionHandler___block_invoke_2;
  v15[3] = &unk_1E54416C8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v11;
  v12 = v9;
  v13 = v8;
  v14 = v11;
  -[WBSAppLink _getAppLinkForBanner:withCompletionHandler:](self, "_getAppLinkForBanner:withCompletionHandler:", 0, v15);

}

void __78__WBSAppLink_openExternallyWithWebBrowserState_referrerURL_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v16 = 0;
    v7 = objc_msgSend(v5, "setEnabled:error:", 1, &v16);
    v8 = v16;
    if ((v7 & 1) == 0)
    {
      v9 = WBS_LOG_CHANNEL_PREFIXUniversalLinks();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __78__WBSAppLink_openExternallyWithWebBrowserState_referrerURL_completionHandler___block_invoke_2_cold_2(a1, v9);
    }
    if (*(_QWORD *)(a1 + 40) || *(_QWORD *)(a1 + 48))
    {
      v10 = objc_alloc_init(MEMORY[0x1E0CA5938]);
      objc_msgSend(v10, "setReferrerURL:", *(_QWORD *)(a1 + 48));
      v11 = *(_QWORD *)(a1 + 40);
      if (v11)
      {
        v17 = *MEMORY[0x1E0D22D10];
        v18[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setFrontBoardOptions:", v12);

      }
    }
    else
    {
      v10 = 0;
    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __78__WBSAppLink_openExternallyWithWebBrowserState_referrerURL_completionHandler___block_invoke_4;
    v14[3] = &unk_1E54416A0;
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = *(id *)(a1 + 56);
    objc_msgSend(v5, "openWithConfiguration:completionHandler:", v10, v14);

  }
  else
  {
    v13 = WBS_LOG_CHANNEL_PREFIXUniversalLinks();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __78__WBSAppLink_openExternallyWithWebBrowserState_referrerURL_completionHandler___block_invoke_2_cold_1(a1, v13);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __78__WBSAppLink_openExternallyWithWebBrowserState_referrerURL_completionHandler___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = WBS_LOG_CHANNEL_PREFIXUniversalLinks();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      v9 = 138739971;
      v10 = v8;
      _os_log_impl(&dword_1A840B000, v7, OS_LOG_TYPE_INFO, "Opened App Link externally for URL %{sensitive}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __78__WBSAppLink_openExternallyWithWebBrowserState_referrerURL_completionHandler___block_invoke_4_cold_1(a1, v7);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)openExternally
{
  -[WBSAppLink openExternallyWithWebBrowserState:referrerURL:completionHandler:](self, "openExternallyWithWebBrowserState:referrerURL:completionHandler:", 0, 0, 0);
}

- (void)disable
{
  -[WBSAppLink disableWithCompletionHandler:](self, "disableWithCompletionHandler:", &__block_literal_global_7);
}

- (void)disableWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__WBSAppLink_disableWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5441638;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WBSAppLink _getAppLinkForBanner:withCompletionHandler:](self, "_getAppLinkForBanner:withCompletionHandler:", 0, v6);

}

void __43__WBSAppLink_disableWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;

  v5 = a3;
  if (a2)
  {
    v10 = 0;
    v6 = objc_msgSend(a2, "setEnabled:error:", 0, &v10);
    v7 = v10;
    if ((v6 & 1) == 0)
    {
      v8 = WBS_LOG_CHANNEL_PREFIXUniversalLinks();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __78__WBSAppLink_openExternallyWithWebBrowserState_referrerURL_completionHandler___block_invoke_2_cold_2(a1, v8);
    }
    (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v7 == 0);

  }
  else
  {
    v9 = WBS_LOG_CHANNEL_PREFIXUniversalLinks();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __43__WBSAppLink_disableWithCompletionHandler___block_invoke_cold_1(a1, v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)_getAppLinkForBanner:(BOOL)a3 withCompletionHandler:(id)a4
{
  void (**v5)(id, LSAppLink *, _QWORD);
  LSAppLink *v6;
  _BOOL4 didResolveAppLink;
  void *v8;
  NSURL *url;
  _QWORD v10[5];
  void (**v11)(id, LSAppLink *, _QWORD);

  v5 = (void (**)(id, LSAppLink *, _QWORD))a4;
  os_unfair_lock_lock(&self->_ivarLock);
  v6 = self->_cachedAppLink;
  didResolveAppLink = self->_didResolveAppLink;
  os_unfair_lock_unlock(&self->_ivarLock);
  if (didResolveAppLink)
  {
    v5[2](v5, v6, 0);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CA5838];
    url = self->_url;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__WBSAppLink__getAppLinkForBanner_withCompletionHandler___block_invoke;
    v10[3] = &unk_1E5441638;
    v10[4] = self;
    v11 = v5;
    objc_msgSend(v8, "getAppLinkWithURL:completionHandler:", url, v10);

  }
}

void __57__WBSAppLink__getAppLinkForBanner_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXUniversalLinks();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      v9 = v7;
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138740227;
      v15 = v8;
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_1A840B000, v9, OS_LOG_TYPE_INFO, "Failed to resolve App Link for URL %{sensitive}@ with error %{public}@", (uint8_t *)&v14, 0x16u);

    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 12) = 1;
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 16);
  *(_QWORD *)(v11 + 16) = v5;
  v13 = v5;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_synchronouslyFetchAppLinkWithError:(id *)a3
{
  os_unfair_lock_s *p_ivarLock;
  LSAppLink *v6;
  _BOOL4 didResolveAppLink;
  LSAppLink *v8;
  void *v9;
  NSObject *v10;
  NSURL *url;
  NSObject *v12;
  void *v13;
  int v15;
  NSURL *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v6 = self->_cachedAppLink;
  didResolveAppLink = self->_didResolveAppLink;
  os_unfair_lock_unlock(p_ivarLock);
  if (didResolveAppLink)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CA5838], "appLinksWithURL:limit:error:", self->_url, 1, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v8 = (LSAppLink *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v10 = WBS_LOG_CHANNEL_PREFIXUniversalLinks();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        url = self->_url;
        v12 = v10;
        objc_msgSend(0, "safari_privacyPreservingDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138740227;
        v16 = url;
        v17 = 2114;
        v18 = v13;
        _os_log_impl(&dword_1A840B000, v12, OS_LOG_TYPE_INFO, "Failed to synchronously resolve App Link for URL %{sensitive}@ with error %{public}@", (uint8_t *)&v15, 0x16u);

      }
    }
    os_unfair_lock_lock(p_ivarLock);
    self->_didResolveAppLink = 1;
    objc_storeStrong((id *)&self->_cachedAppLink, v8);
    os_unfair_lock_unlock(p_ivarLock);
    if (a3)
      *a3 = 0;
  }

  return v8;
}

- (int64_t)_openStrategyForAppLink:(id)a3
{
  if (!a3)
    return 0;
  if (objc_msgSend(a3, "isEnabled"))
    return 3;
  return 1;
}

- (void)_appLink:(id)a3 getAppLinkLabel:(id *)a4 name:(id *)a5 bundleIdentifier:(id *)a6 icon:(id *)a7
{
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "targetApplicationProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB34D0], "safari_isICloudAppWithBundleIdentifier:", v13))
  {
    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", *MEMORY[0x1E0D8A6F0]);
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v14;
  }
  if (!((unint64_t)a4 | (unint64_t)a5))
  {
    v15 = 0;
    v16 = 0;
LABEL_11:
    if (!a7)
      goto LABEL_13;
    goto LABEL_12;
  }
  objc_msgSend(v12, "localizedName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v15);
    if (!a5)
      goto LABEL_7;
    goto LABEL_6;
  }
  v16 = 0;
  if (a5)
LABEL_6:
    *a5 = objc_retainAutorelease(v15);
LABEL_7:
  if (!a4)
    goto LABEL_11;
  objc_msgSend(v12, "itemName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v17));
    *a4 = v18;

  }
  else
  {
    *a4 = objc_retainAutorelease(v16);
  }

  if (a7)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CEA638], "_iconForResourceProxy:format:", v12, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:
  if (a6)
    *a6 = objc_retainAutorelease(v13);
  if (a4 && -[WBSAppLink _isApplicationProxyAppleNews:](self, "_isApplicationProxyAppleNews:", v12))
  {
    if (shouldShowAlternateNewsUniversalLinksFormatting_onceToken != -1)
      dispatch_once(&shouldShowAlternateNewsUniversalLinksFormatting_onceToken, &__block_literal_global_62);
    if (shouldShowAlternateNewsUniversalLinksFormatting_shouldShowAlternateNewsUniversalLinksFormatting)
    {
      _WBSLocalizedString();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      _WBSLocalizedString();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA5F0], "safari_preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB590]);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "fontDescriptorWithSymbolicTraits:", 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = *MEMORY[0x1E0CA8260];
      v45[0] = *MEMORY[0x1E0CA8288];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "fontDescriptorByAddingAttributes:", v19);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x1E0CEA5E8];
      objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontSize");
      objc_msgSend(v20, "fontWithDescriptor:size:", v37);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0CEA5E8];
      objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontSize");
      objc_msgSend(v21, "fontWithDescriptor:size:", v36);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_alloc(MEMORY[0x1E0CB3778]);
      v42 = *MEMORY[0x1E0CEA098];
      v24 = v42;
      v43 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v23, "initWithString:attributes:", v35, v25);

      v26 = objc_alloc(MEMORY[0x1E0CB3778]);
      v40 = v24;
      v41 = v34;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v26, "initWithString:attributes:", v38, v27);

      v29 = objc_msgSend(v38, "rangeOfString:", CFSTR("+"));
      objc_msgSend(v28, "addAttribute:value:range:", v24, v22, v29, v30);
      v31 = objc_msgSend(v35, "rangeOfString:", CFSTR("{apple-news-plus-placeholder}"));
      objc_msgSend(v33, "replaceCharactersInRange:withAttributedString:", v31, v32, v28);

      *a4 = v33;
    }
  }

}

- (BOOL)_isApplicationProxyAppleNews:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.news"));

  return v4;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_cachedAppLink, 0);
}

void __78__WBSAppLink_openExternallyWithWebBrowserState_referrerURL_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = 138739971;
  v4 = v2;
  _os_log_error_impl(&dword_1A840B000, a2, OS_LOG_TYPE_ERROR, "Unable to externally open App Link for URL %{sensitive}@ due to resolution failure", (uint8_t *)&v3, 0xCu);
}

void __78__WBSAppLink_openExternallyWithWebBrowserState_referrerURL_completionHandler___block_invoke_2_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A840B000, v4, v5, "Unable to set App Link policy for URL %{sensitive}@ with error %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

void __78__WBSAppLink_openExternallyWithWebBrowserState_referrerURL_completionHandler___block_invoke_4_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A840B000, v4, v5, "Unable to externally open App Link for URL %{sensitive}@ with error %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

void __43__WBSAppLink_disableWithCompletionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A840B000, v4, v5, "Unable to open URL '%{sensitive}@' in Safari because no LSAppLink was found: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

@end
