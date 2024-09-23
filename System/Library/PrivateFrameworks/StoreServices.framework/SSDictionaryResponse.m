@implementation SSDictionaryResponse

- (SSDictionaryResponse)init
{
  return -[SSDictionaryResponse initWithResponseDictionary:](self, "initWithResponseDictionary:", 0);
}

- (SSDictionaryResponse)initWithResponseDictionary:(id)a3
{
  id v4;
  SSDictionaryResponse *v5;
  uint64_t v6;
  NSDictionary *dictionary;
  objc_super v9;

  v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)SSDictionaryResponse;
    v5 = -[SSDictionaryResponse init](&v9, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      dictionary = v5->_dictionary;
      v5->_dictionary = (NSDictionary *)v6;

    }
  }
  else
  {

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nil dictionary"));
    v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSDictionary copyWithZone:](self->_dictionary, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (NSArray)actions
{
  void *v3;
  SSDialog *v4;
  void *v5;
  void *v6;
  SSDialog *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  SSAccount *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  SSDictionaryResponse *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  -[SSDictionaryResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("dialog"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[SSDialog initWithDialogDictionary:]([SSDialog alloc], "initWithDialogDictionary:", v3);
    if (v4)
    {
      +[SSResponseAction _dialogActionWithDialog:](SSResponseAction, "_dialogActionWithDialog:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addObject:", v5);

    }
  }
  else
  {
    v4 = 0;
  }
  -[SSDictionaryResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("tid-dialog"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  v7 = -[SSDialog initWithDialogDictionary:]([SSDialog alloc], "initWithDialogDictionary:", v6);

  if (v7)
  {
    +[SSResponseAction _dialogActionWithTouchIDDialog:](SSResponseAction, "_dialogActionWithTouchIDDialog:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObject:", v8);

    v4 = v7;
LABEL_8:

  }
  -[SSDictionaryResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("invalidate-url-bags"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v9, "BOOLValue"))
  {
    +[SSResponseAction _invalidateURLBagsAction](SSResponseAction, "_invalidateURLBagsAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObject:", v10);

  }
  v11 = -[SSDictionaryResponse _copyAccount](self, "_copyAccount");
  if (v11)
  {
    +[SSResponseAction _setActiveAccountActionWithAccount:](SSResponseAction, "_setActiveAccountActionWithAccount:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObject:", v12);

  }
  -[SSDictionaryResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("creditDisplay"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SSDictionaryResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("dsPersonId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "integerValue"));
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v15;
    }
    if (v14
      || (-[SSDictionaryResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("dsid")),
          (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "accountWithUniqueIdentifier:", v14);
      v17 = (SSAccount *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        v17 = objc_alloc_init(SSAccount);
        -[SSAccount setUniqueIdentifier:](v17, "setUniqueIdentifier:", v14);
      }
      +[SSResponseAction _setCreditsActionWithCredits:account:](SSResponseAction, "_setCreditsActionWithCredits:account:", v13, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addObject:", v18);

    }
  }
  -[SSDictionaryResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("action"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v19, "objectForKey:", CFSTR("kind"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", CFSTR("url"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_33;
    if (objc_msgSend(v20, "caseInsensitiveCompare:", CFSTR("GoBack")))
    {
      if (objc_msgSend(v20, "caseInsensitiveCompare:", CFSTR("RetryRestoreAll")))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v21);
          if ((objc_msgSend(v20, "isEqualToString:", CFSTR("Goto")) & 1) != 0)
          {
            v23 = CFSTR("SSResponseActionTypeGotoURL");
LABEL_63:
            +[SSResponseAction _urlActionWithType:URL:](SSResponseAction, "_urlActionWithType:URL:", v23, v22);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "addObject:", v43);

            goto LABEL_32;
          }
          if (objc_msgSend(v20, "isEqualToString:", CFSTR("OpenURL")))
          {
            v23 = CFSTR("SSResponseActionTypeOpenURL");
            goto LABEL_63;
          }
LABEL_32:

        }
LABEL_33:

        goto LABEL_34;
      }
      v24 = CFSTR("SSResponseActionTypeRetryRestoreDownloads");
    }
    else
    {
      v24 = CFSTR("SSResponseActionTypeDismissCurrentPage");
    }
    +[SSResponseAction _actionWithActionType:](SSResponseAction, "_actionWithActionType:", v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObject:", v22);
    goto LABEL_32;
  }
LABEL_34:
  v45 = v11;
  -[SSDictionaryResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("selected-footer-section"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[SSResponseAction _selectFooterActionWithSection:](SSResponseAction, "_selectFooterActionWithSection:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObject:", v26);

  }
  -[SSDictionaryResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("trigger-in-app-purchase-queue"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v46 = self;
  v44 = v27;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = v27;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v27);
      v28 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = 0;
    }
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v29 = v28;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v49 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v34, "objectForKey:", CFSTR("client-id"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKey:", CFSTR("environment"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (!v36 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              +[SSResponseAction _checkInAppQueueActionWithClientID:environment:](SSResponseAction, "_checkInAppQueueActionWithClientID:environment:", v35, v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "addObject:", v37);

            }
          }

        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v31);
  }

  -[SSDictionaryResponse _valueForProtocolKey:](v46, "_valueForProtocolKey:", CFSTR("trigger-download"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v38, "BOOLValue"))
  {
    +[SSResponseAction _actionWithActionType:](SSResponseAction, "_actionWithActionType:", CFSTR("SSResponseActionTypeCheckDownloadQueues"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObject:", v39);

  }
  -[SSDictionaryResponse _valueForProtocolKey:](v46, "_valueForProtocolKey:", CFSTR("refresh-subscription-status"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v40, "BOOLValue"))
  {
    +[SSResponseAction _actionWithActionType:](SSResponseAction, "_actionWithActionType:", CFSTR("SSResponseActionTypeRefreshSubscriptionStatus"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObject:", v41);

  }
  return (NSArray *)v47;
}

- (id)actionsWithActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSDictionaryResponse actions](self, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "actionType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (NSNumber)failureType
{
  return (NSNumber *)-[SSDictionaryResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("failureType"));
}

- (BOOL)isSupportedProtocolVersion
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[SSDictionaryResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("store-version"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("1.0"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3
      || (objc_msgSend(v2, "objectForKey:", CFSTR("*")), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v3, "objectForKey:", CFSTR("redirect-url"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4 == 0;

    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (NSArray)pingURLs
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[SSDictionaryResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("pings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[SSDictionaryResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("ping"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v4, 0);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11));
          objc_msgSend(v12, "host");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
            objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
  return (NSArray *)v6;
}

- (NSURL)versionMismatchURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SSDictionaryResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("store-version"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("1.0"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      objc_msgSend(v2, "objectForKey:", CFSTR("*"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "objectForKey:", CFSTR("redirect-url"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return (NSURL *)v5;
}

- (id)_copyAccount
{
  void *v3;
  void *v4;
  void *v5;
  SSAuthenticationResponse *v6;
  id v7;

  -[SSDictionaryResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("accountInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[SSDictionaryResponse _valueForProtocolKey:](self, "_valueForProtocolKey:", CFSTR("set-current-user"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = (void *)objc_msgSend(v4, "mutableCopy");
      objc_msgSend(v3, "objectForKey:", CFSTR("accountInfo"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v3, "addEntriesFromDictionary:", v5);
        objc_msgSend(v3, "removeObjectForKey:", CFSTR("accountInfo"));
      }

    }
    else
    {
      v3 = v4;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[SSAuthenticationResponse initWithURLResponse:dictionary:]([SSAuthenticationResponse alloc], "initWithURLResponse:dictionary:", 0, v3);
    v7 = -[SSAuthenticationResponse newAccount](v6, "newAccount");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_valueForProtocolKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("protocol"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (NSDictionary)responseDictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
