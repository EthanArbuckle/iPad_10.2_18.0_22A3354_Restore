@implementation VUIActionAppPunchout

- (VUIActionAppPunchout)initWithContextData:(id)a3 appContext:(id)a4
{
  id v6;
  id v7;
  VUIActionAppPunchout *v8;
  void *v9;
  uint64_t v10;
  NSURL *punchoutURL;
  uint64_t v12;
  NSDictionary *metrics;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)VUIActionAppPunchout;
  v8 = -[VUIActionAppPunchout init](&v15, sel_init);
  if (v8
    && (objc_msgSend(v6, "vui_URLForKey:", CFSTR("openUrl")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    objc_msgSend(v6, "vui_URLForKey:", CFSTR("openUrl"));
    v10 = objc_claimAutoreleasedReturnValue();
    punchoutURL = v8->_punchoutURL;
    v8->_punchoutURL = (NSURL *)v10;

    objc_msgSend(v6, "vui_dictionaryForKey:", CFSTR("metrics"));
    v12 = objc_claimAutoreleasedReturnValue();
    metrics = v8->_metrics;
    v8->_metrics = (NSDictionary *)v12;

    v8->_isSensitiveURL = objc_msgSend(v6, "vui_BOOLForKey:defaultValue:", CFSTR("isSensitiveUrl"), 0);
    objc_storeWeak((id *)&v8->_appContext, v7);
  }
  else
  {

    v8 = 0;
  }

  return v8;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, BOOL);
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, BOOL))a4;
  -[VUIActionAppPunchout punchoutURL](self, "punchoutURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsString:", CFSTR("music.apple.com"));

    if (v9)
    {
      -[VUIActionAppPunchout _addMusicAppMetricsToUrl:](self, "_addMusicAppMetricsToUrl:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = v7;
    }
    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_INFO, "VUIActionAppPunchout:: punching out to %@", (uint8_t *)&v12, 0xCu);
    }

    -[VUIActionAppPunchout _openPunchoutURL:](self, "_openPunchoutURL:", v10);
  }
  if (v5)
    v5[2](v5, v7 != 0);

}

- (id)_addMusicAppMetricsToUrl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastRecordedPageEventData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "pageId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pageType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "vui_setObjectIfNotNil:forKey:", v10, CFSTR("tvAppPage"));

  }
  -[VUIActionAppPunchout metrics](self, "metrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v5, "addEntriesFromDictionary:", v11);
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v4, "vui_URLByAddingQueryParamsDictionary:", v5);
    v12 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v12;
  }

  return v4;
}

- (void)_openPunchoutURL:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  __CFString *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  __CFString *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  __CFString *v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  _BOOL4 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v5, 0);
  objc_msgSend(v6, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("https"));
  if ((v9 & 1) == 0)
  {
    objc_msgSend(v6, "scheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lowercaseString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("http")))
    {
      v15 = 0;
LABEL_10:

      goto LABEL_11;
    }
    v27 = v10;
  }
  v11 = v5;
  v12 = v6;
  objc_msgSend(v6, "host");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lowercaseString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("tv.apple.com")))
    v15 = +[VUIUtilities isTVApp](VUIUtilities, "isTVApp");
  else
    v15 = 0;

  v6 = v12;
  v5 = v11;
  v10 = v27;
  if ((v9 & 1) == 0)
    goto LABEL_10;
LABEL_11:

  if (-[VUIActionAppPunchout isSensitiveURL](self, "isSensitiveURL"))
  {
    v16 = CFSTR("<sensitive url>");
  }
  else
  {
    objc_msgSend(v5, "description");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  VUIDefaultLogObject();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v34 = v16;
    v35 = 1024;
    v36 = v15;
    v37 = 1024;
    v38 = -[VUIActionAppPunchout isSensitiveURL](self, "isSensitiveURL");
    _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "VUIActionAppPunchout:: open url: %@, punchoutToTVApp: %d, isSensitiveURL: %d", buf, 0x18u);
  }

  if (v15)
  {
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "openURLHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIActionAppPunchout appContext](self, "appContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "deeplinkCompletionHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "processDeeplink:appContext:completion:", v5, v20, v22);

    +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setExitEventDestinationUrl:", v24);
  }
  else
  {
    v23 = objc_alloc_init(MEMORY[0x1E0CA5938]);
    v31 = *MEMORY[0x1E0D22D88];
    v32 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFrontBoardOptions:", v25);

    objc_msgSend(v23, "setSensitive:", self->_isSensitiveURL);
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __41__VUIActionAppPunchout__openPunchoutURL___block_invoke;
    v28[3] = &unk_1E9FA0950;
    v29 = v16;
    v30 = v5;
    objc_msgSend(v26, "openURL:configuration:completionHandler:", v30, v23, v28);

    v24 = v29;
  }

}

void __41__VUIActionAppPunchout__openPunchoutURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v11 = 138412802;
    v12 = v8;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIActionAppPunchout:: open url: %@, result: %@, error: %@", (uint8_t *)&v11, 0x20u);
  }

  if (!v6)
  {
    +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setExitEventDestinationUrl:", v10);

  }
}

- (NSURL)punchoutURL
{
  return self->_punchoutURL;
}

- (BOOL)isSensitiveURL
{
  return self->_isSensitiveURL;
}

- (VUIAppContext)appContext
{
  return (VUIAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (void)setAppContext:(id)a3
{
  objc_storeWeak((id *)&self->_appContext, a3);
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_punchoutURL, 0);
}

@end
