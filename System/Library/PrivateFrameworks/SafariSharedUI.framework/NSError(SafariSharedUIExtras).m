@implementation NSError(SafariSharedUIExtras)

- (uint64_t)safari_isInWebKitLegacyErrorDomain
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CEF800]);

  return v2;
}

- (uint64_t)safari_isPrivacyProxyError
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v1 = a1;
  v2 = *MEMORY[0x1E0C92FB8];
  v3 = *MEMORY[0x1E0CB3388];
  while (1)
  {
    objc_msgSend(v1, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "safari_BOOLForKey:", v2);

    if ((v5 & 1) != 0)
      break;
    objc_msgSend(v1, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v1 = v7;
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_6;
  }
  v7 = v1;
LABEL_6:

  return v5;
}

- (uint64_t)safari_isPrivacyProxyFailClosedError
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_stringForKey:", CFSTR("networkTaskMetricsPrivacyStance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("FailedUnreachable"));
  return v3;
}

- (BOOL)safari_isLocalNetworkContentFilteringError
{
  void *v1;
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_dictionaryForKey:", CFSTR("networkResolutionReport"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v2, "safari_stringForKey:", CFSTR("dnsFailureReason"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (objc_msgSend(v3, "isEqualToString:", CFSTR("censored")) & 1) != 0
      || (objc_msgSend(v3, "isEqualToString:", CFSTR("filtered")) & 1) != 0
      || objc_msgSend(v3, "isEqualToString:", CFSTR("blocked"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)computeLocalNetworkContentFilteringErrorTitle
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_dictionaryForKey:", CFSTR("networkResolutionReport"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "safari_stringForKey:", CFSTR("dnsFailureReason"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "safari_currentTemplateAppName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("censored")))
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("filtered")))
    {
      if (v4)
      {
        v5 = (void *)MEMORY[0x1E0CB3940];
        goto LABEL_9;
      }
    }
    else if (v4)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      goto LABEL_9;
    }
LABEL_10:
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (!v4)
    goto LABEL_10;
  v5 = (void *)MEMORY[0x1E0CB3940];
LABEL_9:
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v7;
}

- (void)fetchLocalNetworkContentFilteringErrorMessageForFailingURLString:()SafariSharedUIExtras withCompletionHandler:
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
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  char v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  char v32;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_dictionaryForKey:", CFSTR("networkResolutionReport"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "safari_stringForKey:", CFSTR("dnsFailureReason"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_stringForKey:", CFSTR("provider"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_arrayForKey:", CFSTR("interfaces"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "safari_stringForKey:", CFSTR("type"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
      v15 = 0;
    else
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("wired"));
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("wifi")))
    {
      v16 = (void *)MEMORY[0x1E0CD0818];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __120__NSError_SafariSharedUIExtras__fetchLocalNetworkContentFilteringErrorMessageForFailingURLString_withCompletionHandler___block_invoke;
      v27[3] = &unk_1E5447EB8;
      v27[4] = a1;
      v28 = v10;
      v29 = v6;
      v30 = v11;
      v32 = v15;
      v31 = v7;
      objc_msgSend(v16, "fetchCurrentWithCompletionHandler:", v27);

    }
    else
    {
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("cellular")))
      {
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", 0);
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __120__NSError_SafariSharedUIExtras__fetchLocalNetworkContentFilteringErrorMessageForFailingURLString_withCompletionHandler___block_invoke_2;
        v19[3] = &unk_1E5447F08;
        v25 = v7;
        v20 = v17;
        v21 = a1;
        v22 = v10;
        v23 = v6;
        v24 = v11;
        v26 = v15;
        v18 = v17;
        objc_msgSend(v18, "getCurrentDataSubscriptionContext:", v19);

      }
      else
      {
        objc_msgSend(a1, "_errorMessageForFailureReason:failingURLString:providerName:networkName:isUsingEthernetNetwork:", v10, v6, v11, 0, v15);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, id))v7 + 2))(v7, v18);
      }

    }
  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (id)_errorMessageForFailureReason:()SafariSharedUIExtras failingURLString:providerName:networkName:isUsingEthernetNetwork:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int v21;
  void *v22;
  id v24;
  id v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (objc_msgSend(v13, "length"))
    v15 = v13;
  else
    v15 = v14;
  v16 = v15;
  objc_msgSend(MEMORY[0x1E0CB34D0], "safari_currentTemplateAppName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isEqualToString:", CFSTR("censored")))
  {
    v21 = objc_msgSend(v11, "isEqualToString:", CFSTR("filtered"));
    v18 = (void *)MEMORY[0x1E0CB3940];
    if (v21)
    {
      if (!a7)
      {
        if (v17)
          goto LABEL_20;
        goto LABEL_25;
      }
      if (v17)
        goto LABEL_16;
    }
    else
    {
      if (!a7)
      {
        if (v17)
        {
LABEL_20:
          _WBSLocalizedString();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v16;
          goto LABEL_21;
        }
LABEL_25:
        _WBSLocalizedString();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v16;
        goto LABEL_26;
      }
      if (v17)
      {
LABEL_16:
        _WBSLocalizedString();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:
        objc_msgSend(v18, "localizedStringWithFormat:", v19, v17, v12, v25);
LABEL_27:
        v20 = objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      }
    }
LABEL_24:
    _WBSLocalizedString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:
    objc_msgSend(v18, "localizedStringWithFormat:", v19, v12, v24, v25);
    goto LABEL_27;
  }
  v18 = (void *)MEMORY[0x1E0CB3940];
  if (!a7)
  {
    if (v17)
      goto LABEL_20;
    goto LABEL_25;
  }
  if (!v17)
    goto LABEL_24;
  _WBSLocalizedString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", v19, v17, v12);
  v20 = objc_claimAutoreleasedReturnValue();
LABEL_28:
  v22 = (void *)v20;

  return v22;
}

- (uint64_t)safari_isRecoverableByPageFormatMenu
{
  return objc_msgSend(a1, "safari_matchesErrorDomain:andCode:", *MEMORY[0x1E0CEF800], 104);
}

@end
