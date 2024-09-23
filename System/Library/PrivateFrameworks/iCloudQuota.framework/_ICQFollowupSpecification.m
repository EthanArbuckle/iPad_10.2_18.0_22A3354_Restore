@implementation _ICQFollowupSpecification

+ (void)clearLegacyFollowupWithController:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[8];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[_ICQHelperFunctions userDefaultsBoolValueForKey:](_ICQHelperFunctions, "userDefaultsBoolValueForKey:", CFSTR("_ICQLegacyQuotaFollowupCleanup.2")))
  {
    _ICQGetLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      +[_ICQFollowupSpecification clearLegacyFollowupWithController:].cold.1(v4);
  }
  else
  {
    +[_ICQHelperFunctions setUserDefaultsBool:forKey:](_ICQHelperFunctions, "setUserDefaultsBool:forKey:", 1, CFSTR("_ICQLegacyQuotaFollowupCleanup.2"));
    _ICQGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "Clearing legacy ICQFollowup items", v6, 2u);
    }

    v7[0] = CFSTR("com.apple.iCloudQuotaDaemon.ICQFollowup");
    v7[1] = CFSTR("com.apple.iCloudQuotaDaemon.StorageManagement.followup");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clearPendingFollowUpItemsWithUniqueIdentifiers:completion:", v4, &__block_literal_global_20);
  }

}

- (_ICQFollowupSpecification)init
{
  _ICQFollowupSpecification *v2;
  _ICQFollowupSpecification *v3;
  NSArray *links;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_ICQFollowupSpecification;
  v2 = -[_ICQFollowupSpecification init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    links = v2->_links;
    v2->_links = (NSArray *)MEMORY[0x1E0C9AA60];

    *(_WORD *)&v3->_premiumOffer = 0;
  }
  return v3;
}

- (_ICQFollowupSpecification)initWithServerDictionary:(id)a3
{
  id v4;
  _ICQFollowupSpecification *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *offerId;

  v4 = a3;
  v5 = -[_ICQFollowupSpecification init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("followUpInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQFollowupSpecification setServerDict:](v5, "setServerDict:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("badgeApp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_badgeApp = _ICQBooleanForServerObjectDefault(v7, 1);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPremiumOffer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_premiumOffer = _ICQBooleanForServerObjectDefault(v8, 0);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEventOffer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_eventOffer = _ICQBooleanForServerObjectDefault(v9, 0);

    _ICQStringForKey(v4, CFSTR("offerId"));
    v10 = objc_claimAutoreleasedReturnValue();
    offerId = v5->_offerId;
    v5->_offerId = (NSString *)v10;

  }
  return v5;
}

- (id)identifierPrefix
{
  __CFString **v3;
  _BOOL4 v4;

  if (-[_ICQFollowupSpecification premiumOffer](self, "premiumOffer"))
  {
    v3 = _ICQIdentifierPrefixPremium;
  }
  else
  {
    v4 = -[_ICQFollowupSpecification eventOffer](self, "eventOffer");
    v3 = _ICQIdentifierPrefixRegular;
    if (v4)
      v3 = _ICQIdentifierPrefixEvent;
  }
  return *v3;
}

- (id)followupActionForLink:(id)a3
{
  return -[_ICQFollowupSpecification followupActionForLink:needsFlow:](self, "followupActionForLink:needsFlow:", a3, 0);
}

- (id)followupActionForLink:(id)a3 needsFlow:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("skipCFU"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dismissLockScreen"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqualToString:", CFSTR("true")))
  {
    _ICQGetLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[_ICQFollowupSpecification followupActionForLink:needsFlow:].cold.1((uint64_t)v5, v10);

    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("context"), CFSTR("skipCFU"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB39D8];
    -[_ICQFollowupSpecification identifierPrefix](self, "identifierPrefix");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "queryItemWithName:value:", CFSTR("followUpItemIdentifier"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("dismissLockScreen"), v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ServerLinkId"), CFSTR("lockscreen"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://icq.icloud.com"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v11;
    v29[1] = v14;
    v29[2] = v15;
    v29[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "icq_URLByAppendingQueryItems:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }
  v20 = (void *)MEMORY[0x1E0D15E28];
  objc_msgSend(v5, "text");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "actionWithLabel:url:", v21, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  _ICQStringForAction(objc_msgSend(v5, "action"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = CFSTR("ICQLinkAction");
  v27[1] = CFSTR("ICQLinkParameters");
  v28[0] = v23;
  objc_msgSend(v5, "parameters");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setUserInfo:", v25);

  return v22;
}

- (NSURL)serverUIURL
{
  NSArray *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_links;
  v3 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "serverUIURL", (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend(v6, "serverUIURL");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v3 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (NSURL *)v3;
}

- (NSURL)dynamicUIRouteURL
{
  NSArray *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_links;
  v3 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "dynamicUIRouteURL", (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend(v6, "dynamicUIRouteURL");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v3 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (NSURL *)v3;
}

- (NSString)purchaseAttribution
{
  NSArray *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_links;
  v3 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "purchaseAttribution", (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend(v6, "purchaseAttribution");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v3 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (NSString *)v3;
}

- (void)postFollowupWithController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_ICQFollowupSpecification identifierPrefix](self, "identifierPrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", v6, 0);

  -[_ICQFollowupSpecification _buildFollowupItem](self, "_buildFollowupItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v4, "postFollowUpItem:error:", v7, &v12);

  v8 = v12;
  _ICQGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "groupIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, "Posted ICQFollowup item (title:%@ group:%@) with error: %@", buf, 0x20u);

  }
}

- (void)postFollowupWithController:(id)a3 replaceExisting:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (a4)
  {
    -[_ICQFollowupSpecification identifierPrefix](self, "identifierPrefix");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", v12, 0);

    -[_ICQFollowupSpecification _postFollowupWithController:completion:](self, "_postFollowupWithController:completion:", v8, v10);
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __83___ICQFollowupSpecification_postFollowupWithController_replaceExisting_completion___block_invoke;
    v13[3] = &unk_1E8B3A020;
    v13[4] = self;
    v15 = v9;
    v14 = v8;
    objc_msgSend(v14, "pendingFollowUpItemsWithCompletion:", v13);

  }
}

- (void)_postFollowupWithController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a4;
  v7 = a3;
  -[_ICQFollowupSpecification _buildFollowupItem](self, "_buildFollowupItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68___ICQFollowupSpecification__postFollowupWithController_completion___block_invoke;
  v11[3] = &unk_1E8B38C78;
  v12 = v8;
  v13 = v6;
  v9 = v6;
  v10 = v8;
  objc_msgSend(v7, "postFollowUpItem:completion:", v10, v11);

}

- (id)_buildFollowupItem
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  const __CFString *v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CDEBD000, v3, OS_LOG_TYPE_DEFAULT, "Building followup item", buf, 2u);
  }

  v4 = (void *)objc_opt_new();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  -[_ICQFollowupSpecification links](self, "links", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v50;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v50 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v9);
        -[_ICQFollowupSpecification noteActivateLink](self, "noteActivateLink");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_ICQFollowupSpecification followupActionForLink:needsFlow:](self, "followupActionForLink:needsFlow:", v10, v10 == v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v7);
  }

  -[_ICQFollowupSpecification noteTitle](self, "noteTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "length"))
  {

    goto LABEL_18;
  }
  -[_ICQFollowupSpecification noteMessage](self, "noteMessage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (!v15)
  {
LABEL_18:
    v16 = 0;
    goto LABEL_19;
  }
  v16 = (void *)objc_opt_new();
  -[_ICQFollowupSpecification noteTitle](self, "noteTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTitle:", v17);

  -[_ICQFollowupSpecification noteSubTitle](self, "noteSubTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSubtitleText:", v18);

  -[_ICQFollowupSpecification noteMessage](self, "noteMessage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICQFollowupSpecification altNoteMessage](self, "altNoteMessage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQDaemonOffer stringWithPlaceholderFormat:alternateString:](ICQDaemonOffer, "stringWithPlaceholderFormat:alternateString:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setInformativeText:", v21);

  -[_ICQFollowupSpecification noteActivateLink](self, "noteActivateLink");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[_ICQFollowupSpecification noteActivateLink](self, "noteActivateLink");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQFollowupSpecification followupActionForLink:needsFlow:](self, "followupActionForLink:needsFlow:", v23, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActivateAction:", v24);

  }
  -[_ICQFollowupSpecification noteClearLink](self, "noteClearLink");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[_ICQFollowupSpecification noteClearLink](self, "noteClearLink");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQFollowupSpecification followupActionForLink:](self, "followupActionForLink:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setClearAction:", v27);

  }
  objc_msgSend(v16, "setFrequency:", INFINITY);
LABEL_19:
  v28 = (void *)objc_opt_new();
  -[_ICQFollowupSpecification identifierPrefix](self, "identifierPrefix");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setUniqueIdentifier:", v29);

  -[_ICQFollowupSpecification title](self, "title");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTitle:", v30);

  -[_ICQFollowupSpecification message](self, "message");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICQFollowupSpecification altMessage](self, "altMessage");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQDaemonOffer stringWithPlaceholderFormat:alternateString:](ICQDaemonOffer, "stringWithPlaceholderFormat:alternateString:", v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setInformativeText:", v33);

  objc_msgSend(v28, "setActions:", v4);
  objc_msgSend(v28, "setNotification:", v16);
  objc_msgSend(v28, "setExtensionIdentifier:", CFSTR("com.apple.iCloudQuota.ICQFollowup"));
  -[_ICQFollowupSpecification addNotifyingAppIdForItem:](self, "addNotifyingAppIdForItem:", v28);
  objc_msgSend(v28, "userInfo");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v28, "userInfo");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v35, "mutableCopy");

    -[_ICQFollowupSpecification offerId](self, "offerId");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v37, CFSTR("offerId"));

    objc_msgSend(v28, "setUserInfo:", v36);
  }
  else
  {
    v55 = CFSTR("offerId");
    -[_ICQFollowupSpecification offerId](self, "offerId");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v36;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setUserInfo:", v38);

  }
  if (-[_ICQFollowupSpecification isForAccountGroup](self, "isForAccountGroup"))
    objc_msgSend(v28, "setGroupIdentifier:", *MEMORY[0x1E0D15DE0]);
  if (-[_ICQFollowupSpecification isZeroAction](self, "isZeroAction"))
    objc_msgSend(v28, "setDisplayStyle:", objc_msgSend(v28, "displayStyle") | 2);
  if (!-[_ICQFollowupSpecification badgeApp](self, "badgeApp"))
  {
    _ICQGetLogSystem();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v39, OS_LOG_TYPE_DEFAULT, "not badging app", buf, 2u);
    }

    objc_msgSend(v28, "setDisplayStyle:", objc_msgSend(v28, "displayStyle") | 0x10);
  }
  if (-[_ICQFollowupSpecification followupDisplayStyle](self, "followupDisplayStyle") == 1)
  {
    objc_msgSend(v28, "setGroupIdentifier:", *MEMORY[0x1E0D15E00]);
    objc_msgSend(v28, "setDisplayStyle:", objc_msgSend(v28, "displayStyle") | 0x12);
  }
  -[_ICQFollowupSpecification groupIdentifier](self, "groupIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[_ICQFollowupSpecification groupIdentifier](self, "groupIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ICQHelperFunctions followUpGroupIdentifierForString:](_ICQHelperFunctions, "followUpGroupIdentifierForString:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    _ICQGetLogSystem();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v42;
      _os_log_impl(&dword_1CDEBD000, v43, OS_LOG_TYPE_DEFAULT, "Setting CFU group identifier to %@", buf, 0xCu);
    }

    objc_msgSend(v28, "setGroupIdentifier:", v42);
  }
  -[_ICQFollowupSpecification sfSymbolID](self, "sfSymbolID");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    -[_ICQFollowupSpecification sfSymbolID](self, "sfSymbolID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setBundleIconName:", v45);

  }
  -[_ICQFollowupSpecification sfSymbolBundlePath](self, "sfSymbolBundlePath");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    -[_ICQFollowupSpecification sfSymbolBundlePath](self, "sfSymbolBundlePath");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setRepresentingBundlePath:", v47);

  }
  return v28;
}

+ (void)clearFollowupWithController:(id)a3 offerType:(int64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a3;
  _ICQGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:](_ICQHelperFunctions, "_getOfferDescriptionFromRequestType:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v10;
    _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, "Clearing ICQFollowup items for offerType %@", buf, 0xCu);

  }
  +[_ICQHelperFunctions followUpIdentifierPrefixForRequestType:](_ICQHelperFunctions, "followUpIdentifierPrefixForRequestType:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearPendingFollowUpItemsWithUniqueIdentifiers:completion:", v12, v7);

}

+ (id)sharedFollowUpController
{
  if (sharedFollowUpController_onceToken != -1)
    dispatch_once(&sharedFollowUpController_onceToken, &__block_literal_global_53);
  return (id)sharedFollowUpController_controller;
}

+ (void)clearNotificationWithController:(id)a3 offerType:(int64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a5;
  +[_ICQHelperFunctions followUpIdentifierPrefixForRequestType:](_ICQHelperFunctions, "followUpIdentifierPrefixForRequestType:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82___ICQFollowupSpecification_clearNotificationWithController_offerType_completion___block_invoke;
  v13[3] = &unk_1E8B3A088;
  v14 = v9;
  v15 = v7;
  v16 = v8;
  v10 = v8;
  v11 = v7;
  v12 = v9;
  objc_msgSend(v11, "pendingFollowUpItemsWithCompletion:", v13);

}

- (NSDictionary)serverDict
{
  return self->_serverDict;
}

- (void)setServerDict:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  const char *Name;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  NSObject *v21;
  objc_class *v22;
  const char *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  int v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  _ICQFollowupSpecification *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  void *v62;
  NSObject *v63;
  objc_class *v64;
  const char *v65;
  void *v66;
  void *v67;
  char v68;
  void *v69;
  NSObject *v70;
  objc_class *v71;
  const char *v72;
  void *v73;
  ICQLink *v74;
  ICQLink *v75;
  void *v76;
  void *v77;
  _ICQFollowupSpecification *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint8_t buf[4];
  const char *v88;
  __int16 v89;
  void *v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_serverDict, a3);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICQFollowupSpecification setTitle:](self, "setTitle:", v6);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mesg"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_ICQFollowupSpecification setMessage:](self, "setMessage:", v7);
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("message"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQFollowupSpecification setMessage:](self, "setMessage:", v8);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("altMesg"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[_ICQFollowupSpecification setAltMessage:](self, "setAltMessage:", v9);
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("altMessage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQFollowupSpecification setAltMessage:](self, "setAltMessage:", v10);

  }
  -[_ICQFollowupSpecification message](self, "message");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    -[_ICQFollowupSpecification message](self, "message");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      _ICQGetLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (objc_class *)objc_opt_class();
        Name = class_getName(v15);
        -[_ICQFollowupSpecification message](self, "message");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v88 = Name;
        v89 = 2112;
        v90 = v17;
        _os_log_impl(&dword_1CDEBD000, v14, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);

      }
    }
    -[_ICQFollowupSpecification setMessage:](self, "setMessage:", 0);
  }
  -[_ICQFollowupSpecification altMessage](self, "altMessage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v19 = objc_opt_isKindOfClass();

  if ((v19 & 1) == 0)
  {
    -[_ICQFollowupSpecification altMessage](self, "altMessage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      _ICQGetLogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (objc_class *)objc_opt_class();
        v23 = class_getName(v22);
        -[_ICQFollowupSpecification altMessage](self, "altMessage");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v88 = v23;
        v89 = 2112;
        v90 = v24;
        _os_log_impl(&dword_1CDEBD000, v21, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);

      }
    }
    -[_ICQFollowupSpecification setAltMessage:](self, "setAltMessage:", 0);
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("actions"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  v78 = self;
  if (v25)
  {
    v27 = v25;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Actions"));
    v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  v28 = v27;
  v79 = v5;

  v29 = v28;
  v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v29, "count"));
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v30 = v29;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v83, buf, 16);
  v81 = v30;
  if (v31)
  {
    v32 = v31;
    v80 = 0;
    v33 = 0;
    v34 = *(_QWORD *)v84;
    while (1)
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v84 != v34)
          objc_enumerationMutation(v30);
        v36 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v35);
        _ICQLinkForServerMessageParameter(v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          objc_msgSend(v82, "addObject:", v37);
          v38 = v36;
          objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("btnDefault"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v39;
          if (v39)
          {
            v41 = v39;
          }
          else
          {
            objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("BtnDefault"));
            v41 = (id)objc_claimAutoreleasedReturnValue();
          }
          v42 = v41;

          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v43 = objc_msgSend(v42, "BOOLValue");

            if (v43)
              v80 = objc_retainAutorelease(v37);
          }
          else
          {

          }
          v44 = v38;
          objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("btnId"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v45, "isEqualToString:", CFSTR("dlCancel")) & 1) != 0)
            goto LABEL_38;
          objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("btnId"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v46, "isEqualToString:", CFSTR("cancelled")))
          {

LABEL_38:
LABEL_39:
            v33 = objc_retainAutorelease(v37);
            goto LABEL_40;
          }
          objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("btnAction"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("DISMISS_ALERT"));

          v30 = v81;
          if ((v48 & 1) != 0)
            goto LABEL_39;
        }
LABEL_40:

        ++v35;
      }
      while (v32 != v35);
      v49 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v83, buf, 16);
      v32 = v49;
      if (!v49)
        goto LABEL_47;
    }
  }
  v80 = 0;
  v33 = 0;
LABEL_47:

  v50 = v30;
  v51 = (void *)objc_msgSend(v82, "copy");

  v52 = v80;
  v53 = v33;
  v54 = v78;
  -[_ICQFollowupSpecification setLinks:](v78, "setLinks:", v51);

  objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("lockTitle"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICQFollowupSpecification setNoteTitle:](v78, "setNoteTitle:", v55);

  objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("lockMesg"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (v56)
  {
    -[_ICQFollowupSpecification setNoteMessage:](v78, "setNoteMessage:", v56);
  }
  else
  {
    objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("lockMessage"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQFollowupSpecification setNoteMessage:](v78, "setNoteMessage:", v57);

  }
  objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("altLockMesg"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    -[_ICQFollowupSpecification setAltNoteMessage:](v78, "setAltNoteMessage:", v58);
  }
  else
  {
    objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("altLockMessage"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ICQFollowupSpecification setAltNoteMessage:](v78, "setAltNoteMessage:", v59);

  }
  -[_ICQFollowupSpecification noteMessage](v78, "noteMessage");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v61 = objc_opt_isKindOfClass();

  if ((v61 & 1) == 0)
  {
    -[_ICQFollowupSpecification noteMessage](v78, "noteMessage");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
    {
      _ICQGetLogSystem();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        v64 = (objc_class *)objc_opt_class();
        v65 = class_getName(v64);
        -[_ICQFollowupSpecification noteMessage](v78, "noteMessage");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v88 = v65;
        v89 = 2112;
        v90 = v66;
        _os_log_impl(&dword_1CDEBD000, v63, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);

      }
    }
    -[_ICQFollowupSpecification setNoteMessage:](v78, "setNoteMessage:", 0, v78);
  }
  -[_ICQFollowupSpecification altNoteMessage](v54, "altNoteMessage", v78);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v68 = objc_opt_isKindOfClass();

  if ((v68 & 1) == 0)
  {
    -[_ICQFollowupSpecification altNoteMessage](v54, "altNoteMessage");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (v69)
    {
      _ICQGetLogSystem();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        v71 = (objc_class *)objc_opt_class();
        v72 = class_getName(v71);
        -[_ICQFollowupSpecification altNoteMessage](v54, "altNoteMessage");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v88 = v72;
        v89 = 2112;
        v90 = v73;
        _os_log_impl(&dword_1CDEBD000, v70, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);

      }
    }
    -[_ICQFollowupSpecification setAltNoteMessage:](v54, "setAltNoteMessage:", 0);
  }
  -[_ICQFollowupSpecification setNoteActivateLink:](v54, "setNoteActivateLink:", v52);
  if (v53)
  {
    -[_ICQFollowupSpecification setNoteClearLink:](v54, "setNoteClearLink:", v53);
  }
  else
  {
    v74 = [ICQLink alloc];
    v75 = -[ICQLink initWithText:action:parameters:](v74, "initWithText:action:parameters:", &stru_1E8B3C468, 101, MEMORY[0x1E0C9AA70]);
    -[_ICQFollowupSpecification setNoteClearLink:](v54, "setNoteClearLink:", v75);

  }
  objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("enableDirectAction"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICQFollowupSpecification setZeroAction:](v54, "setZeroAction:", _ICQBooleanForServerObjectDefault(v76, 0));

  objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("groupIdentifier"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICQFollowupSpecification setGroupIdentifier:](v54, "setGroupIdentifier:", v77);

}

- (int64_t)primaryAction
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[_ICQFollowupSpecification links](self, "links", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "parameters");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("btnId"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("followUpOkBtnId"));

        v12 = objc_msgSend(v8, "action");
        if ((v11 & 1) != 0)
        {
          v5 = v12;
          goto LABEL_14;
        }
        if (v12)
          v5 = objc_msgSend(v8, "action");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v5 = 0;
  }
LABEL_14:

  return v5;
}

- (void)addNotifyingAppIdForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_ICQFollowupSpecification notifyingAppId](self, "notifyingAppId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v8 = ICQFollowupNotifyingAppIdKey;
    -[_ICQFollowupSpecification notifyingAppId](self, "notifyingAppId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUserInfo:", v7);

  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)altMessage
{
  return self->_altMessage;
}

- (void)setAltMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)links
{
  return self->_links;
}

- (void)setLinks:(id)a3
{
  objc_storeStrong((id *)&self->_links, a3);
}

- (NSString)noteTitle
{
  return self->_noteTitle;
}

- (void)setNoteTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)noteSubTitle
{
  return self->_noteSubTitle;
}

- (void)setNoteSubTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)noteMessage
{
  return self->_noteMessage;
}

- (void)setNoteMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)altNoteMessage
{
  return self->_altNoteMessage;
}

- (void)setAltNoteMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (ICQLink)noteActivateLink
{
  return self->_noteActivateLink;
}

- (void)setNoteActivateLink:(id)a3
{
  objc_storeStrong((id *)&self->_noteActivateLink, a3);
}

- (ICQLink)noteClearLink
{
  return self->_noteClearLink;
}

- (void)setNoteClearLink:(id)a3
{
  objc_storeStrong((id *)&self->_noteClearLink, a3);
}

- (BOOL)isForAccountGroup
{
  return self->_forAccountGroup;
}

- (void)setForAccountGroup:(BOOL)a3
{
  self->_forAccountGroup = a3;
}

- (BOOL)isZeroAction
{
  return self->_zeroAction;
}

- (void)setZeroAction:(BOOL)a3
{
  self->_zeroAction = a3;
}

- (BOOL)badgeApp
{
  return self->_badgeApp;
}

- (void)setBadgeApp:(BOOL)a3
{
  self->_badgeApp = a3;
}

- (int64_t)followupDisplayStyle
{
  return self->_followupDisplayStyle;
}

- (void)setFollowupDisplayStyle:(int64_t)a3
{
  self->_followupDisplayStyle = a3;
}

- (NSString)sfSymbolID
{
  return self->_sfSymbolID;
}

- (void)setSfSymbolID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)sfSymbolBundlePath
{
  return self->_sfSymbolBundlePath;
}

- (void)setSfSymbolBundlePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)notifyingAppId
{
  return self->_notifyingAppId;
}

- (void)setNotifyingAppId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)premiumOffer
{
  return self->_premiumOffer;
}

- (void)setPremiumOffer:(BOOL)a3
{
  self->_premiumOffer = a3;
}

- (BOOL)eventOffer
{
  return self->_eventOffer;
}

- (void)setEventOffer:(BOOL)a3
{
  self->_eventOffer = a3;
}

- (NSString)offerId
{
  return self->_offerId;
}

- (void)setOfferId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offerId, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_notifyingAppId, 0);
  objc_storeStrong((id *)&self->_sfSymbolBundlePath, 0);
  objc_storeStrong((id *)&self->_sfSymbolID, 0);
  objc_storeStrong((id *)&self->_noteClearLink, 0);
  objc_storeStrong((id *)&self->_noteActivateLink, 0);
  objc_storeStrong((id *)&self->_altNoteMessage, 0);
  objc_storeStrong((id *)&self->_noteMessage, 0);
  objc_storeStrong((id *)&self->_noteSubTitle, 0);
  objc_storeStrong((id *)&self->_noteTitle, 0);
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_altMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_serverDict, 0);
}

- (void)followupActionForLink:(uint64_t)a1 needsFlow:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1CDEBD000, a2, OS_LOG_TYPE_DEBUG, "Skipping CFU for lockscreen link: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)clearLegacyFollowupWithController:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1CDEBD000, log, OS_LOG_TYPE_DEBUG, "Skipping legacy CFU cleanup. Already been done", v1, 2u);
}

@end
