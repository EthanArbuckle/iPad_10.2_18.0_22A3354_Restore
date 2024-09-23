@implementation ICQPurchase

- (ICQPurchase)initWithOffer:(id)a3 clientInfo:(id)a4
{
  id v6;
  id v7;
  ICQPurchase *v8;
  ICQPurchase *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSURLSession *session;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ICQPurchase;
  v8 = -[ICQPurchase init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ICQPurchase setOffer:](v8, "setOffer:", v6);
    objc_storeStrong((id *)&v9->_clientInfo, a4);
    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0ACD8]), "initWithIdentifier:", CFSTR("ICQPurchaseURLSession"));
    objc_msgSend(v10, "set_appleIDContext:", v11);

    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v10);
    v12 = objc_claimAutoreleasedReturnValue();
    session = v9->_session;
    v9->_session = (NSURLSession *)v12;

  }
  return v9;
}

- (id)actionString
{
  void *v2;
  void *v3;

  -[ICQPurchase clientInfo](self, "clientInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("action"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)offerAction
{
  void *v2;
  int64_t v3;

  -[ICQPurchase actionString](self, "actionString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _ICQActionForServerActionString();

  return v3;
}

- (void)startPurchaseWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ICQPurchase clientInfo](self, "clientInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("parameters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ICQPurchase offerAction](self, "offerAction");
  -[ICQPurchase preparePurchase](self, "preparePurchase");
  +[ICQPurchase parseParameters:action:](ICQPurchase, "parseParameters:action:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)objc_msgSend(v4, "copy");
    -[ICQPurchase setCompletionHandler:](self, "setCompletionHandler:", v9);

    -[ICQPurchase offer](self, "offer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQPurchase actionString](self, "actionString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateOfferWithPlanDetails:actionString:", v8, v11);

    -[ICQPurchase beginPurchaseFlow](self, "beginPurchaseFlow");
  }
  else
  {
    _ICQGetLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[ICQPurchase actionString](self, "actionString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = 0;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_21F2CC000, v12, OS_LOG_TYPE_DEFAULT, "No plan details found for planDetails %@ and actionString %@.", (uint8_t *)&v15, 0x16u);

    }
    ICQCreateError();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v14);

  }
}

- (void)preparePurchase
{
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, a2, a3, "error parsing interruptedBuyErrorCodes: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)beginPurchaseFlow
{
  OUTLINED_FUNCTION_1(&dword_21F2CC000, a1, a3, "AMSPurchase did not support selector setAccount", a5, a6, a7, a8, 0);
}

uint64_t __32__ICQPurchase_beginPurchaseFlow__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handlePurchaseCompletionWithError:");
}

- (void)handlePurchaseCompletionWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  ICQPurchase *v25;
  _QWORD *v26;
  void (*v27)(void);
  void *v28;
  uint64_t v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  NSArray *interruptedBuyErrorCodes;
  void *v35;
  _BOOL4 v36;
  NSObject *v37;
  _BOOL4 v38;
  int64_t v39;
  const char *v40;
  NSObject *v41;
  uint32_t v42;
  int64_t v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  char v50;
  void *v51;
  void *v52;
  int v53;
  int64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ICQPurchase handlePurchaseCompletionWithError:].cold.1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v53) = 0;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "Oslo purchase completed without any error!", (uint8_t *)&v53, 2u);
  }

  -[ICQPurchase delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[ICQPurchase delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stopActivityIndicator");

  }
  -[ICQPurchase setAmsServerErrorCode:](self, "setAmsServerErrorCode:", 0);
  objc_msgSend(v4, "domain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BE07D20]);

  if (!v17)
  {
LABEL_20:
    if (objc_msgSend(v4, "code") == 305)
    {
      interruptedBuyErrorCodes = self->_interruptedBuyErrorCodes;
      if (interruptedBuyErrorCodes)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -[ICQPurchase amsServerErrorCode](self, "amsServerErrorCode"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[NSArray containsObject:](interruptedBuyErrorCodes, "containsObject:", v35);

        _ICQGetLogSystem();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
        if (v36)
        {
          if (v38)
          {
            v39 = -[ICQPurchase amsServerErrorCode](self, "amsServerErrorCode");
            v53 = 134217984;
            v54 = v39;
            v40 = "interrupted flow with error code = %ld";
            v41 = v37;
            v42 = 12;
LABEL_31:
            _os_log_impl(&dword_21F2CC000, v41, OS_LOG_TYPE_DEFAULT, v40, (uint8_t *)&v53, v42);
            goto LABEL_32;
          }
          goto LABEL_32;
        }
        if (v38)
        {
          v43 = -[ICQPurchase amsServerErrorCode](self, "amsServerErrorCode");
          v53 = 134217984;
          v54 = v43;
          _os_log_impl(&dword_21F2CC000, v37, OS_LOG_TYPE_DEFAULT, "uninterrupted flow with error code = %ld", (uint8_t *)&v53, 0xCu);
        }

      }
    }
    if (!objc_msgSend(v4, "icq_isPSD2StepUpError"))
    {
      if (v4
        && -[ICQPurchase amsServerErrorCode](self, "amsServerErrorCode") != 3067
        && -[ICQPurchase amsServerErrorCode](self, "amsServerErrorCode") != 3068
        && -[ICQPurchase amsServerErrorCode](self, "amsServerErrorCode") != 8067
        && -[ICQPurchase amsServerErrorCode](self, "amsServerErrorCode") != 8068)
      {
        v25 = self;
        v24 = 1;
LABEL_16:
        -[ICQPurchase setStatusCode:](v25, "setStatusCode:", v24);
        -[ICQPurchase completionHandler](self, "completionHandler");
        v26 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v27 = (void (*)(void))v26[2];
LABEL_47:
        v27();
        goto LABEL_48;
      }
      -[ICQPurchase setStatusCode:](self, "setStatusCode:", 0);
      -[ICQPurchase clientInfo](self, "clientInfo");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("action"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("UPGRADE_ENABLE_ICPL_OSLO"));

      if (v48)
      {
        -[ICQPurchase delegate](self, "delegate");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_opt_respondsToSelector();

        if ((v50 & 1) != 0)
        {
          -[ICQPurchase delegate](self, "delegate");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "enableCloudPhotoLibraryWithCompletion:", &__block_literal_global_2);

        }
      }
      if (!-[ICQPurchase isLegacyNativeFlow](self, "isLegacyNativeFlow")
        || -[ICQPurchase amsServerErrorCode](self, "amsServerErrorCode") != 3068
        && -[ICQPurchase amsServerErrorCode](self, "amsServerErrorCode") != 8068)
      {
        -[ICQPurchase completionHandler](self, "completionHandler");
        v26 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v27 = (void (*)(void))v26[2];
        goto LABEL_47;
      }
      -[ICQPurchase completionHandler](self, "completionHandler");
      v26 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      ICQCreateErrorWithMessage();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(_QWORD *, uint64_t, void *))v26[2])(v26, 1, v52);

      goto LABEL_48;
    }
    _ICQGetLogSystem();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v53) = 0;
      v40 = "PSD2 step-up detected. Registering for darwin notifications.";
      v41 = v37;
      v42 = 2;
      goto LABEL_31;
    }
LABEL_32:

    -[ICQPurchase delegate](self, "delegate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_opt_respondsToSelector();

    if ((v45 & 1) == 0)
      goto LABEL_49;
    -[ICQPurchase delegate](self, "delegate");
    v26 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "registerForDarwinNotifications");
LABEL_48:

    goto LABEL_49;
  }
  if (objc_msgSend(v4, "code") != 6)
  {
    if (objc_msgSend(v4, "code") == 305)
    {
      objc_msgSend(v4, "userInfo");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *MEMORY[0x24BE07D38];
      objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x24BE07D38]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_opt_respondsToSelector();

      if ((v31 & 1) != 0)
      {
        objc_msgSend(v4, "userInfo");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKeyedSubscript:", v29);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICQPurchase setAmsServerErrorCode:](self, "setAmsServerErrorCode:", objc_msgSend(v33, "longValue"));

      }
    }
    goto LABEL_20;
  }
  -[ICQPurchase delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isLiftUIFlow");

  if (v19)
  {
    -[ICQPurchase setStatusCode:](self, "setStatusCode:", 1);
    -[ICQPurchase completionHandler](self, "completionHandler");
    v20 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v20)[2](v20, 0, v4);

  }
  -[ICQPurchase offer](self, "offer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "action");

  if (v22 == 118)
  {
    _ICQGetLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v53) = 0;
      _os_log_impl(&dword_21F2CC000, v23, OS_LOG_TYPE_DEFAULT, "Purchase cancelled during direct to oslo, running completion", (uint8_t *)&v53, 2u);
    }

    v24 = objc_msgSend(v4, "code");
    v25 = self;
    goto LABEL_16;
  }
LABEL_49:

}

+ (id)upgradeStorageQueryDictionaryForOffer:(id)a3 buttonID:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  +[ICQPurchase upgradeStorageKeyBagForOffer:buttonID:](ICQPurchase, "upgradeStorageKeyBagForOffer:buttonID:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a1, "upgradeStorageQueryKeySet", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v8, "setObject:forKey:", v16, v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  return v8;
}

+ (id)upgradeStorageKeyBagForOffer:(id)a3 buttonID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    objc_msgSend(v5, "storagePurchaseKeybagForButtonId:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "buttonSpecification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "buttonLink");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "parameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ServerLinkId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "storagePurchaseKeybagForButtonId:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v10;
  }

  return v7;
}

+ (id)upgradeStorageQueryKeySet
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24E435E00);
}

+ (id)parseParameters:(id)a3 action:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  v7 = 0;
  v8 = a4 - 105;
  if ((unint64_t)(a4 - 105) <= 0x16)
  {
    if (((1 << v8) & 0x403800) != 0)
    {
      v9 = objc_alloc(MEMORY[0x24BDBCED8]);
      v14 = CFSTR("buyParams");
      v15[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "initWithDictionary:", v10);
LABEL_6:
      v7 = (void *)v11;

      goto LABEL_7;
    }
    if (((1 << v8) & 9) != 0)
    {
      objc_msgSend(v5, "dataUsingEncoding:", 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v10, 0, &v13);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
LABEL_7:

  return v7;
}

+ (id)userAgentForBundleIdentifier:(id)a3 appVersion:(id)a4 attributionSuffix:(id)a5
{
  uint64_t v6;

  if (a5)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@ %@%@"), a3, a4, a5, CFSTR(" CastleSettings/1.0"));
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@%@"), a3, a4, CFSTR(" CastleSettings/1.0"), v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)clearCacheAndNotifyClientsWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__ICQPurchase_clearCacheAndNotifyClientsWithCompletion___block_invoke;
  v8[3] = &unk_24E3F3568;
  v9 = v4;
  v10 = a1;
  v5 = v4;
  v6 = _Block_copy(v8);

  return v6;
}

void __56__ICQPurchase_clearCacheAndNotifyClientsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if ((_DWORD)a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "clearCacheAndNotifyClients", v5);
    v5 = v7;
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
    v5 = v7;
  }

}

+ (void)clearCacheAndNotifyClients
{
  NSObject *v2;
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 buf;
  Class (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "+[ICQPurchase clearCacheAndNotifyClients]";
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BE17DC8], "clearCacheAndNotify");
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v3 = (void *)getINDaemonConnectionClass_softClass_1;
  v12 = getINDaemonConnectionClass_softClass_1;
  if (!getINDaemonConnectionClass_softClass_1)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v14 = __getINDaemonConnectionClass_block_invoke_1;
    v15 = &unk_24E3F3868;
    v16 = &v9;
    __getINDaemonConnectionClass_block_invoke_1((uint64_t)&buf);
    v3 = (void *)v10[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v9, 8);
  v5 = objc_alloc_init(v4);
  objc_msgSend(v5, "daemonWithErrorHandler:", &__block_literal_global_94, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "aa_primaryAppleAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "teardownOffersForAccount:withCompletion:", v8, &__block_literal_global_97);

}

void __41__ICQPurchase_clearCacheAndNotifyClients__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  _ICQGetLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __41__ICQPurchase_clearCacheAndNotifyClients__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __41__ICQPurchase_clearCacheAndNotifyClients__block_invoke_95()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  _ICQGetLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_21F2CC000, v0, OS_LOG_TYPE_DEFAULT, "Offers teardown has completed.", v2, 2u);
  }

  objc_msgSend(MEMORY[0x24BEC7300], "sharedOfferManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "getDefaultOfferWithCompletion:", &__block_literal_global_101);

}

void __41__ICQPurchase_clearCacheAndNotifyClients__block_invoke_99(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  if (v3)
  {
    _ICQGetLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __41__ICQPurchase_clearCacheAndNotifyClients__block_invoke_99_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  }
}

- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];

  v8 = a6;
  v9 = a3;
  _ICQGetLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "We were asked to authenticate.  Attempting silent authentication.", v12, 2u);
  }

  -[ICQPurchase delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleAuthenticateRequest:purchase:completion:", v9, self, v8);

}

- (void)handleDialogRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];

  v8 = a6;
  v9 = a3;
  _ICQGetLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "We were asked to handle a dialog request", v12, 2u);
  }

  -[ICQPurchase delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleDialogRequest:purchase:completion:", v9, self, v8);

}

- (void)handleEngagementRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];

  v8 = a6;
  v9 = a3;
  _ICQGetLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "We were asked to handle an engagement request", v12, 2u);
  }

  -[ICQPurchase delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleEngagementRequest:purchase:completion:", v9, self, v8);

}

- (ICQPurchaseDelegate)delegate
{
  return (ICQPurchaseDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isLegacyNativeFlow
{
  return self->_isLegacyNativeFlow;
}

- (void)setIsLegacyNativeFlow:(BOOL)a3
{
  self->_isLegacyNativeFlow = a3;
}

- (int64_t)amsServerErrorCode
{
  return self->_amsServerErrorCode;
}

- (void)setAmsServerErrorCode:(int64_t)a3
{
  self->_amsServerErrorCode = a3;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int64_t)a3
{
  self->_statusCode = a3;
}

- (NSString)presentingSceneIdentifier
{
  return self->_presentingSceneIdentifier;
}

- (void)setPresentingSceneIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)presentingSceneBundleIdentifier
{
  return self->_presentingSceneBundleIdentifier;
}

- (void)setPresentingSceneBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (ICQOffer)offer
{
  return self->_offer;
}

- (void)setOffer:(id)a3
{
  objc_storeStrong((id *)&self->_offer, a3);
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSDictionary)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (NSArray)interruptedBuyErrorCodes
{
  return self->_interruptedBuyErrorCodes;
}

- (void)setInterruptedBuyErrorCodes:(id)a3
{
  objc_storeStrong((id *)&self->_interruptedBuyErrorCodes, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)userAgentSuffix
{
  return self->_userAgentSuffix;
}

- (void)setUserAgentSuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgentSuffix, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_interruptedBuyErrorCodes, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_offer, 0);
  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)handlePurchaseCompletionWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, a2, a3, "Oslo purchase completed with error = %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __41__ICQPurchase_clearCacheAndNotifyClients__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_21F2CC000, a1, a3, "XPC Error while fetching storage detail.", a5, a6, a7, a8, 0);
}

void __41__ICQPurchase_clearCacheAndNotifyClients__block_invoke_99_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, a2, a3, "Error refreshing default offer! %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
