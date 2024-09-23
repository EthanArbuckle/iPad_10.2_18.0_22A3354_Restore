@implementation UIAddToHomeScreenActivity

+ (unint64_t)_xpcAttributes
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
    return 3;
  else
    return 0;
}

- (id)activityType
{
  return CFSTR("com.apple.UIKit.activity.AddToHomeScreen");
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  _ShareSheetBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AddToHomeScreen[Activity]"), CFSTR("Add to Home Screen"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_systemImageName
{
  return CFSTR("plus.app");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v3;
  NSObject *v4;
  const char *v5;
  Class v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  char v22;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[8];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((_ShareSheetIsBrowser() & 1) != 0)
  {
    if (canPerformWithActivityItems__onceToken != -1)
      dispatch_once(&canPerformWithActivityItems__onceToken, &__block_literal_global_3);
    if (!canPerformWithActivityItems__addToHomeScreenDisabled)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v4 = v3;
      v8 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v29;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v29 != v10)
              objc_enumerationMutation(v4);
            v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v12, "URL");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v6) = objc_msgSend(v19, "isHTTPOrHTTPSURL");

              if ((v6 & 1) == 0)
              {
                share_sheet_log();
                v20 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_19E419000, v20, OS_LOG_TYPE_DEFAULT, "UIAddToHomeScreenActivity: Activity item did not provide an eligible HTTP(S) URL", buf, 2u);
                }

              }
              goto LABEL_11;
            }
          }
          v9 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
          if (v9)
            continue;
          break;
        }
      }

      v6 = NSClassFromString(CFSTR("WKWebView"));
      if (v6)
      {
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v13 = v4;
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v25;
LABEL_23:
          v17 = 0;
          while (1)
          {
            if (*(_QWORD *)v25 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v17);
            if ((objc_opt_isKindOfClass() & 1) != 0)
              break;
            if (v15 == ++v17)
            {
              v15 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
              if (v15)
                goto LABEL_23;
              goto LABEL_29;
            }
          }
          v4 = v18;

          if (!v4)
            goto LABEL_37;
          -[NSObject URL](v4, "URL", (_QWORD)v24);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isHTTPOrHTTPSURL");

          if ((v22 & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_11;
          }
          share_sheet_log();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19E419000, v23, OS_LOG_TYPE_DEFAULT, "UIAddToHomeScreenActivity: WKWebView is not currently displaying an eligible HTTP(S) URL", buf, 2u);
          }
        }
        else
        {
LABEL_29:

LABEL_37:
          share_sheet_log();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19E419000, v23, OS_LOG_TYPE_DEFAULT, "UIAddToHomeScreenActivity: activityItems array does not contain a WKWebView", buf, 2u);
          }
          v4 = 0;
        }

        goto LABEL_10;
      }
      share_sheet_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      *(_WORD *)buf = 0;
      v5 = "UIAddToHomeScreenActivity: activityItems array cannot contain a WKWebView";
      goto LABEL_9;
    }
    share_sheet_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v5 = "UIAddToHomeScreenActivity: 'Add to Home Screen' is disabled";
LABEL_9:
      _os_log_impl(&dword_19E419000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
    }
  }
  else
  {
    share_sheet_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v5 = "UIAddToHomeScreenActivity: App does not have the default browser entitlement";
      goto LABEL_9;
    }
  }
LABEL_10:
  LOBYTE(v6) = 0;
LABEL_11:

  return (char)v6;
}

void __57__UIAddToHomeScreenActivity_canPerformWithActivityItems___block_invoke()
{
  id v0;

  -[objc_class sharedConnection](getMCProfileConnectionClass(), "sharedConnection");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  canPerformWithActivityItems__addToHomeScreenDisabled = objc_msgSend(v0, "isEphemeralMultiUser");

}

- (void)prepareWithActivityItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  id v15;
  void *v16;
  int v17;
  id v18;
  id v19;
  UIViewController *v20;
  UIViewController *addToHomeScreenViewController;
  id v22;
  id v23;
  UIViewController *v24;
  UIViewController *v25;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  id location;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v37 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        getWKWebViewClass();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "URL");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "isHTTPOrHTTPSURL");

          if (v9)
          {
            location = 0;
            objc_initWeak(&location, self);
            v18 = objc_alloc(getSFAddToHomeScreenViewControllerClass());
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v19 = v18;
              v33[0] = MEMORY[0x1E0C809B0];
              v33[1] = 3221225472;
              v33[2] = __54__UIAddToHomeScreenActivity_prepareWithActivityItems___block_invoke;
              v33[3] = &unk_1E4001540;
              objc_copyWeak(&v34, &location);
              v20 = (UIViewController *)objc_msgSend(v19, "initWithWebView:completion:", v7, v33);
              addToHomeScreenViewController = self->_addToHomeScreenViewController;
              self->_addToHomeScreenViewController = v20;

              objc_destroyWeak(&v34);
            }

            objc_destroyWeak(&location);
            goto LABEL_28;
          }
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v4)
        continue;
      break;
    }
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = v3;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v30;
    while (2)
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
        if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v15 = v14;
          objc_msgSend(v15, "URL");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isHTTPOrHTTPSURL");

          if (v17)
          {
            v22 = objc_alloc(getSFAddToHomeScreenViewControllerClass());
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              location = 0;
              objc_initWeak(&location, self);
              v23 = v22;
              v27[0] = MEMORY[0x1E0C809B0];
              v27[1] = 3221225472;
              v27[2] = __54__UIAddToHomeScreenActivity_prepareWithActivityItems___block_invoke_2;
              v27[3] = &unk_1E4001540;
              objc_copyWeak(&v28, &location);
              v24 = (UIViewController *)objc_msgSend(v23, "initWithAddToHomeScreenActivityItem:completion:", v15, v27);
              v25 = self->_addToHomeScreenViewController;
              self->_addToHomeScreenViewController = v24;

              objc_destroyWeak(&v28);
              objc_destroyWeak(&location);
            }

            goto LABEL_28;
          }

        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_28:

}

void __54__UIAddToHomeScreenActivity_prepareWithActivityItems___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "activityDidFinish:", a2);

}

void __54__UIAddToHomeScreenActivity_prepareWithActivityItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "activityDidFinish:", a2);

}

- (id)activityViewController
{
  return self->_addToHomeScreenViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addToHomeScreenViewController, 0);
}

@end
