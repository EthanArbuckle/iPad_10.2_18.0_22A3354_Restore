@implementation VUIAction

+ (id)actionWithDictionary:(id)a3 appContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  VUIActionShareSheet *v9;
  VUIActionShareSheet *v10;
  NSObject *v11;
  __objc2_class *v13;
  __objc2_class *v14;
  VUIActionRemoveFromPlayHistory *v15;
  void *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "vui_stringForKey:", CFSTR("actionRef"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vui_dictionaryForKey:", CFSTR("contextData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = 0;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "VUIApplicationAction: Unknown action type %@", (uint8_t *)&v18, 0xCu);
    }
    goto LABEL_17;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefBuy")) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefGet")) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefPreorder")) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefRent")) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefRentWatchNow")) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefComplete")) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefUpdate")) & 1) == 0
    && !objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefSubscribe")))
  {
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefPlay")) & 1) != 0
      || objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefRedownload")))
    {
      if (!v5)
      {
        VUIDefaultLogObject();
        v11 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          goto LABEL_17;
        goto LABEL_16;
      }
      v13 = VUIActionPlay;
      goto LABEL_24;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefPlaylist")))
    {
      if (!v5)
      {
        VUIDefaultLogObject();
        v11 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          goto LABEL_17;
        goto LABEL_16;
      }
      v13 = VUIActionPlaylist;
      goto LABEL_24;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefAppPunchout")))
    {
      v13 = VUIActionAppPunchout;
      goto LABEL_24;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefPunchout")))
    {
      v13 = VUIActionPunchout;
      goto LABEL_24;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefPromise")))
    {
      if (!v5)
      {
        VUIDefaultLogObject();
        v11 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          goto LABEL_17;
        goto LABEL_16;
      }
      v13 = VUIActionPromise;
      goto LABEL_24;
    }
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefItunesExtras")) & 1) != 0)
      goto LABEL_18;
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefShareMediaItem")))
    {
      v9 = -[VUIActionShareSheet initWithContextData:sourceView:]([VUIActionShareSheet alloc], "initWithContextData:sourceView:", v8, 0);
      goto LABEL_12;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefUpdateUpNext")))
    {
      v14 = VUIActionUpdateUpNext;
      goto LABEL_48;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefMarkAsWatched")))
    {
      v14 = VUIActionMarkedAsWatched;
      goto LABEL_48;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefRemoveFromPlayHistory")))
    {
      v15 = [VUIActionRemoveFromPlayHistory alloc];
      v16 = v8;
      v17 = 0;
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefClearFromPlayHistory")))
      {
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefUpdateMusic")))
        {
          v14 = VUIActionUpdateMusic;
        }
        else
        {
          if (objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefAlert")))
          {
            if (v5)
            {
              v9 = -[VUIActionAlert initWithContextData:appContext:controllerClass:]([VUIActionAlert alloc], "initWithContextData:appContext:controllerClass:", v8, v5, objc_opt_class());
              goto LABEL_12;
            }
            VUIDefaultLogObject();
            v11 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              goto LABEL_17;
            goto LABEL_16;
          }
          if (objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefLocationPrompt")))
          {
            v14 = VUIActionLocationPrompt;
          }
          else
          {
            if (!objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefUpdateSportsFavorite")))
            {
              if (objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefGdprProceed")))
              {
                if (!v5)
                {
                  VUIDefaultLogObject();
                  v11 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                    goto LABEL_17;
                  goto LABEL_16;
                }
                v13 = VUIActionTypeGDPR;
              }
              else
              {
                if (objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefSystemSettings")))
                {
                  v14 = VUIActionSystemSettings;
                  goto LABEL_48;
                }
                if (objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefARQLPreview")))
                {
                  v14 = VUIActionARQLPreview;
                  goto LABEL_48;
                }
                if (objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefBundleOffer")))
                {
                  v14 = VUIActionBundleOffer;
                  goto LABEL_48;
                }
                if (objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefActivateCarrierOffer")))
                {
                  v14 = VUIActionActivateCarrierOffer;
                  goto LABEL_48;
                }
                if (objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefLeaveGroupSession")))
                {
                  v9 = objc_alloc_init(VUIActionLeaveGroupSession);
                  goto LABEL_12;
                }
                if (objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefSearchRAC")))
                {
                  v14 = VUIActionSearchRAC;
                  goto LABEL_48;
                }
                if (!objc_msgSend(v7, "isEqualToString:", CFSTR("actionRefOpenWebLink")))
                  goto LABEL_18;
                if (!v5)
                {
                  VUIDefaultLogObject();
                  v11 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                    goto LABEL_17;
                  goto LABEL_16;
                }
                v13 = VUIActionOpenWebLink;
              }
LABEL_24:
              v9 = (VUIActionShareSheet *)objc_msgSend([v13 alloc], "initWithContextData:appContext:", v8, v5);
              goto LABEL_12;
            }
            v14 = VUIActionUpdateSportsFavorite;
          }
        }
LABEL_48:
        v9 = (VUIActionShareSheet *)objc_msgSend([v14 alloc], "initWithContextData:", v8);
        goto LABEL_12;
      }
      v15 = [VUIActionRemoveFromPlayHistory alloc];
      v16 = v8;
      v17 = 1;
    }
    v9 = -[VUIActionRemoveFromPlayHistory initWithContextData:isContinueWatching:](v15, "initWithContextData:isContinueWatching:", v16, v17);
    goto LABEL_12;
  }
  if (!v5)
  {
    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

LABEL_18:
      v10 = 0;
      goto LABEL_19;
    }
LABEL_16:
    +[VUIAction actionWithDictionary:appContext:].cold.1();
    goto LABEL_17;
  }
  v9 = -[VUIActionCommerceTransaction initWithActionRef:contextData:appContext:]([VUIActionCommerceTransaction alloc], "initWithActionRef:contextData:appContext:", v7, v8, v5);
LABEL_12:
  v10 = v9;
LABEL_19:

  return v10;
}

- (BOOL)isAccountRequired
{
  return 0;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  if (a4)
    (*((void (**)(id, uint64_t))a4 + 2))(a4, 1);
}

+ (void)actionWithDictionary:appContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, v0, v1, "VUIApplicationAction: AppContext is nil for action type %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_9();
}

@end
