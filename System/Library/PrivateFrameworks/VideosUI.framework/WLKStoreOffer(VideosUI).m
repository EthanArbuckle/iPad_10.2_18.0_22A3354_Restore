@implementation WLKStoreOffer(VideosUI)

- (id)vui_subscriptionOfferButtonText
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;

  objc_msgSend(a1, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vui_stringForKey:", CFSTR("ctaCopy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "length"))
  {
    if (objc_msgSend(a1, "offerType") != 4)
    {
      v4 = 0;
      goto LABEL_24;
    }
    objc_msgSend(a1, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:", CFSTR("TV.Button.SubscribeChannel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_localize:token:value:", v7, CFSTR("channelName"), v5);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(a1, "subscriptionType");
    if (v8 != 3)
    {
      if (v8 != 2)
      {
LABEL_23:

        goto LABEL_24;
      }
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:", CFSTR("TV.Button.SubscribeChannelFree"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_localize:token:value:", v10, CFSTR("channelName"), v5);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    objc_msgSend(a1, "introOfferPeriod");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12;
    if (v12)
    {
      objc_msgSend(v12, "type");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *MEMORY[0x1E0DC89F8];
      if (objc_msgSend(v13, "isEqual:", *MEMORY[0x1E0DC89F8]))
      {
        objc_msgSend(v10, "duration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToNumber:", &unk_1EA0B9BE0);

      }
      else
      {
        v16 = 0;
      }

      objc_msgSend(v10, "duration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "integerValue");

      objc_msgSend(v10, "type");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqual:", *MEMORY[0x1E0DC8A00]);

      if ((v20 & 1) != 0 || v16)
      {
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localizedStringForKey:", CFSTR("TV.Button.FreeYears"));
        v24 = objc_claimAutoreleasedReturnValue();

        if (v16)
          v26 = 1;
        else
          v26 = v18;
        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v24, CFSTR("%d"), 0, v26);
        goto LABEL_20;
      }
      objc_msgSend(v10, "type");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqual:", v14);

      if (v22)
      {
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "localizedStringForKey:", CFSTR("TV.Button.FreeMonths"));
        v24 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v24, CFSTR("%d"), 0, v18);
LABEL_20:
        v11 = objc_claimAutoreleasedReturnValue();

        v4 = (id)v24;
LABEL_21:

        v4 = (id)v11;
      }
    }

    goto LABEL_23;
  }
  v4 = v3;
LABEL_24:

  return v4;
}

- (id)vui_subscriptionOfferDisclaimerText
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;

  objc_msgSend(a1, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vui_stringForKey:", CFSTR("legalLine"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "length"))
  {
    objc_msgSend(a1, "renewalPeriod");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "specialOfferEligible"))
    {
      objc_msgSend(a1, "freeTrialPeriod");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v8 = v6;
      }
      else
      {
        objc_msgSend(a1, "introOfferPeriod");
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      v9 = v8;

      objc_msgSend(v9, "type");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "type");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      v4 = 0;
      if (v10 && v11)
      {
        objc_msgSend(v9, "duration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "integerValue");

        objc_msgSend(v9, "type");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqual:", *MEMORY[0x1E0DC8A00]);

        if (v16)
        {
          objc_msgSend(v9, "duration");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 12 * objc_msgSend(v17, "integerValue");

          v18 = (id)*MEMORY[0x1E0DC89F8];
          v10 = v18;
        }
        if (_FreeTrialLocMap_onceToken != -1)
          dispatch_once(&_FreeTrialLocMap_onceToken, &__block_literal_global_89);
        v19 = (void *)MEMORY[0x1E0CB3940];
        v20 = (id)_FreeTrialLocMap___freeMap;
        v33 = v12;
        objc_msgSend(v19, "stringWithFormat:", CFSTR("%@_%@"), v10, v12);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "localizedStringForKey:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v24, CFSTR("%d"), 0, v14);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "formattedPrice");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_localize:token:value:", v25, CFSTR("price"), v26);
          v4 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v4 = 0;
        }

        v12 = v33;
      }

      if (v4)
        goto LABEL_26;
    }
    else
    {
      v4 = 0;
    }
    if (v5)
    {
      objc_msgSend(v5, "type");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (_PaidSubscriptionLocMap_onceToken != -1)
        dispatch_once(&_PaidSubscriptionLocMap_onceToken, &__block_literal_global_46);
      objc_msgSend((id)_PaidSubscriptionLocMap___paidMap, "objectForKey:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "localizedStringForKey:", v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1, "formattedPrice");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_localize:token:value:", v30, CFSTR("price"), v31);
        v4 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v4 = 0;
      }

    }
LABEL_26:

    goto LABEL_27;
  }
  v4 = v3;
LABEL_27:

  return v4;
}

- (id)_localize:()VideosUI token:value:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v7 && v8 && v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@@%@@@"), v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    VUIDefaultLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "WLKStoreOffer+VideosUI - Invalid localization input: string:%@ token:%@ value:%@", buf, 0x20u);
    }

    v12 = 0;
  }

  return v12;
}

@end
