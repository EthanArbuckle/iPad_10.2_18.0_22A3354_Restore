@implementation WBSPasswordBreachNotificationManager

- (WBSPasswordBreachNotificationManager)init
{
  WBSPasswordBreachNotificationManager *v2;
  uint64_t v3;
  UNUserNotificationCenter *notificationCenter;
  WBSPasswordWarningTopFraudTargetsManager *v5;
  WBSPasswordWarningTopFraudTargetsManager *topFraudTargetsManager;
  WBSPasswordBreachNotificationManager *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WBSPasswordBreachNotificationManager;
  v2 = -[WBSPasswordBreachNotificationManager init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", CFSTR("com.apple.Safari.PasswordBreachNotifications"));
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (UNUserNotificationCenter *)v3;

    v5 = (WBSPasswordWarningTopFraudTargetsManager *)objc_alloc_init(MEMORY[0x1E0D89CA8]);
    topFraudTargetsManager = v2->_topFraudTargetsManager;
    v2->_topFraudTargetsManager = v5;

    v7 = v2;
  }

  return v2;
}

- (void)addBreachNotificationForSavedAccounts:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  WBSPasswordWarningTopFraudTargetsManager *topFraudTargetsManager;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    topFraudTargetsManager = self->_topFraudTargetsManager;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __100__WBSPasswordBreachNotificationManager_addBreachNotificationForSavedAccounts_withCompletionHandler___block_invoke;
    v10[3] = &unk_1E4B3DC48;
    v10[4] = self;
    v11 = v6;
    v12 = v7;
    -[WBSPasswordWarningTopFraudTargetsManager getTopFraudTargetsWithCompletionHandler:](topFraudTargetsManager, "getTopFraudTargetsWithCompletionHandler:", v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x1E0CB2FE0], 22, CFSTR("Cannot add a notification for zero passwords."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v9);

  }
}

void __100__WBSPasswordBreachNotificationManager_addBreachNotificationForSavedAccounts_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  dispatch_get_global_queue(17, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __100__WBSPasswordBreachNotificationManager_addBreachNotificationForSavedAccounts_withCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E4B38908;
  v5 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v3;
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(v4, v7);

}

void __100__WBSPasswordBreachNotificationManager_addBreachNotificationForSavedAccounts_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_contentWithSavedAccounts:topFraudTargets:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0CEC740];
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "isPasswordManagerAppEnabled"))
    v3 = (__CFString *)(id)*MEMORY[0x1E0D89EE8];
  else
    v3 = CFSTR("com.apple.Safari.PasswordBreachNotifications.NewBreach");
  objc_msgSend(v2, "requestWithIdentifier:content:trigger:", v3, v6, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0D89BE8], "isPasswordManagerAppEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0D89CB0], "sharedNotificationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "schedulePasswordBreachNotificationRequest:completionHandler:", v4, *(_QWORD *)(a1 + 56));

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addNotificationRequest:withCompletionHandler:", v4, *(_QWORD *)(a1 + 56));
  }

}

- (id)_contentWithSavedAccounts:(id)a3 topFraudTargets:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0CEC6E0];
  v8 = a4;
  v9 = objc_alloc_init(v7);
  -[WBSPasswordBreachNotificationManager _titleForSavedAccounts:](self, "_titleForSavedAccounts:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v10);

  +[WBSPasswordBreachNotificationManager _bodyForSavedAccounts:withTopFraudTargets:](WBSPasswordBreachNotificationManager, "_bodyForSavedAccounts:withTopFraudTargets:", v6, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setBody:", v11);
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSPasswordBreachNotificationManager _passwordManagerURLForSavedAccount:](self, "_passwordManagerURLForSavedAccount:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D89C90], "passwordManagerSecurityRecommendationsURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "setDefaultActionURL:", v13);

  return v9;
}

- (id)_passwordManagerURLForSavedAccount:(id)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[3];
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D89BE8];
  v4 = a3;
  if (objc_msgSend(v3, "isPasswordManagerAppEnabled"))
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v4, "stableID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(v5, "initWithData:encoding:", v6, 4);
    v8 = (void *)MEMORY[0x1E0D89C90];
    v17 = CFSTR("Security");
    v18[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "passwordManagerURLWithDictionary:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "highLevelDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "user");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0D89C90];
    v12 = *MEMORY[0x1E0D89EC8];
    v15[0] = *MEMORY[0x1E0D89EC0];
    v15[1] = v12;
    v16[0] = v7;
    v16[1] = v9;
    v15[2] = *MEMORY[0x1E0D89ED8];
    v16[2] = *MEMORY[0x1E0D89ED0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "passwordManagerURLWithDictionary:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_titleForSavedAccounts:(id)a3
{
  objc_msgSend(a3, "count");
  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_bodyForSavedAccounts:(id)a3 withTopFraudTargets:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_81);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D89BD0], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "deviceClass");

  objc_msgSend(a1, "_bodyForHighLevelDomains:deviceClass:topFraudTargets:", v7, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __82__WBSPasswordBreachNotificationManager__bodyForSavedAccounts_withTopFraudTargets___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "highLevelDomain");
}

+ (unint64_t)_bodyStyleForTopFraudTargetDomains:(id)a3 sensitiveDomains:(id)a4 passwordsCount:(unint64_t)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t result;
  _BOOL4 v12;

  v7 = a4;
  v8 = objc_msgSend(a3, "count");
  v9 = objc_msgSend(v7, "count");

  if (a5 == 1 && !v8 && v9 == 1)
    return 5;
  v12 = v8 == 1 && v9 == 0;
  result = a5 != 1 || !v12;
  if (!v12)
  {
    if (v8 != 2 || v9)
    {
      if (v8 != 3 || v9)
      {
        if ((unint64_t)(v9 + v8) >= 0xA || v8 == 0)
          return 6;
        else
          return 4;
      }
      else
      {
        return 3;
      }
    }
    else
    {
      return 2;
    }
  }
  return result;
}

+ (BOOL)_highLevelDomain:(id)a3 isIncludedInTopFraudTargets:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "highPriorityFraudTargets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "containsObject:", v5) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v6, "fraudTargets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "containsObject:", v5) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(v6, "financialFraudTargets");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "containsObject:", v5);

    }
  }

  return v8;
}

+ (id)_bodyForHighLevelDomains:(id)a3 deviceClass:(int)a4 topFraudTargets:(id)a5
{
  void *v6;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v6 = *(void **)&a4;
  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (objc_msgSend(a1, "_highLevelDomain:isIncludedInTopFraudTargets:", v17, v9))
          v18 = v10;
        else
          v18 = v11;
        objc_msgSend(v18, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v14);
  }

  v19 = objc_msgSend(a1, "_bodyStyleForTopFraudTargetDomains:sensitiveDomains:passwordsCount:", v10, v11, objc_msgSend(v12, "count"));
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "isPasswordManagerAppEnabledAndInstalled"))
  {
    switch(v19)
    {
      case 0:
        v20 = (void *)MEMORY[0x1E0CB3940];
        goto LABEL_38;
      case 1:
        v20 = (void *)MEMORY[0x1E0CB3940];
LABEL_38:
        _WBSLocalizedString();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", v24, v25);
        v28 = objc_claimAutoreleasedReturnValue();
        goto LABEL_39;
      case 2:
        v21 = (void *)MEMORY[0x1E0CB3940];
LABEL_28:
        _WBSLocalizedString();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", v24, v25, v26);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      case 3:
        v22 = (void *)MEMORY[0x1E0CB3940];
LABEL_30:
        _WBSLocalizedString();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", v24, v25, v26, v27);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_31:
        goto LABEL_40;
      case 4:
        v23 = (void *)MEMORY[0x1E0CB3940];
LABEL_33:
        _WBSLocalizedString();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "localizedStringWithFormat:", v24, v25, objc_msgSend(v10, "count") + objc_msgSend(v11, "count") - 1);
        v28 = objc_claimAutoreleasedReturnValue();
LABEL_39:
        v6 = (void *)v28;
LABEL_40:

LABEL_41:
        break;
      case 5:
      case 6:
        _WBSLocalizedString();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        goto LABEL_14;
    }
  }
  else
  {
LABEL_14:
    if ((_DWORD)v6 != 3)
    {
      switch(v19)
      {
        case 0:
          v20 = (void *)MEMORY[0x1E0CB3940];
          goto LABEL_38;
        case 1:
          v20 = (void *)MEMORY[0x1E0CB3940];
          goto LABEL_38;
        case 2:
          v21 = (void *)MEMORY[0x1E0CB3940];
          goto LABEL_28;
        case 3:
          v22 = (void *)MEMORY[0x1E0CB3940];
          goto LABEL_30;
        case 4:
          v23 = (void *)MEMORY[0x1E0CB3940];
          goto LABEL_33;
        case 5:
          v29 = (void *)MEMORY[0x1E0CB3940];
          goto LABEL_45;
        case 6:
          v29 = (void *)MEMORY[0x1E0CB3940];
LABEL_45:
          _WBSLocalizedString();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "stringWithFormat:", v24);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_41;
        default:
          goto LABEL_42;
      }
    }
    switch(v19)
    {
      case 0:
        v20 = (void *)MEMORY[0x1E0CB3940];
        goto LABEL_38;
      case 1:
        v20 = (void *)MEMORY[0x1E0CB3940];
        goto LABEL_38;
      case 2:
        v21 = (void *)MEMORY[0x1E0CB3940];
        goto LABEL_28;
      case 3:
        v22 = (void *)MEMORY[0x1E0CB3940];
        goto LABEL_30;
      case 4:
        v23 = (void *)MEMORY[0x1E0CB3940];
        goto LABEL_33;
      case 5:
        v29 = (void *)MEMORY[0x1E0CB3940];
        goto LABEL_45;
      case 6:
        v29 = (void *)MEMORY[0x1E0CB3940];
        goto LABEL_45;
      default:
        break;
    }
  }
LABEL_42:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topFraudTargetsManager, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end
