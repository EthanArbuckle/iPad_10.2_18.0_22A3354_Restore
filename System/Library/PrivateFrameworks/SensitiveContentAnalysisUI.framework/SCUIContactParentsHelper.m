@implementation SCUIContactParentsHelper

+ (void)openChatWithParentsForInterventionType:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 1)
      dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global);
  }
  else
  {
    +[SCUIContactParentsHelper obtainParentsForCurrentContact:](SCUIContactParentsHelper, "obtainParentsForCurrentContact:", &__block_literal_global_13);
  }
}

void __67__SCUIContactParentsHelper_openChatWithParentsForInterventionType___block_invoke()
{
  id v0;

  +[SCUIContactParentsHelper urlFromAddressList:](SCUIContactParentsHelper, "urlFromAddressList:", 0);
  v0 = (id)objc_claimAutoreleasedReturnValue();
  +[SCUIContactParentsHelper openChatWithURL:](SCUIContactParentsHelper, "openChatWithURL:", v0);

}

void __67__SCUIContactParentsHelper_openChatWithParentsForInterventionType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _QWORD block[4];
  id v5;

  v2 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__SCUIContactParentsHelper_openChatWithParentsForInterventionType___block_invoke_3;
  block[3] = &unk_2516EC7D0;
  v5 = v2;
  v3 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __67__SCUIContactParentsHelper_openChatWithParentsForInterventionType___block_invoke_3(uint64_t a1)
{
  id v1;

  +[SCUIContactParentsHelper urlFromAddressList:](SCUIContactParentsHelper, "urlFromAddressList:", *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  +[SCUIContactParentsHelper openChatWithURL:](SCUIContactParentsHelper, "openChatWithURL:", v1);

}

+ (void)obtainChatWithParentsURLForInterventionType:(int64_t)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v6 = (void (**)(_QWORD, _QWORD))v5;
  if (a3)
  {
    if (a3 == 1)
    {
      +[SCUIContactParentsHelper urlFromAddressList:](SCUIContactParentsHelper, "urlFromAddressList:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v6)[2](v6, v7);

    }
  }
  else
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __90__SCUIContactParentsHelper_obtainChatWithParentsURLForInterventionType_completionHandler___block_invoke;
    v8[3] = &unk_2516EC7F8;
    v9 = v5;
    +[SCUIContactParentsHelper obtainParentsForCurrentContact:](SCUIContactParentsHelper, "obtainParentsForCurrentContact:", v8);

  }
}

void __90__SCUIContactParentsHelper_obtainChatWithParentsURLForInterventionType_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  +[SCUIContactParentsHelper urlFromAddressList:](SCUIContactParentsHelper, "urlFromAddressList:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

+ (void)openChatWithURL:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BEBD3C8];
  v4 = a3;
  objc_msgSend(v3, "sharedApplication");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openURL:options:completionHandler:", v4, MEMORY[0x24BDBD1B8], 0);

}

+ (id)urlFromAddressList:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("service"), CFSTR("iMessage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  v6 = (void *)MEMORY[0x24BDD1838];
  +[SCUIResources localizedStringForKey:](SCUIResources, "localizedStringForKey:", CFSTR("MESSAGE_GROWNUP_BODY"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryItemWithName:value:", CFSTR("body"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

  if (objc_msgSend(v3, "count"))
  {
    v9 = (void *)MEMORY[0x24BDD1838];
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "queryItemWithName:value:", CFSTR("recipients"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("best-match"), CFSTR("1"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);

  }
  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", CFSTR("sms://open"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setQueryItems:", v4);
  objc_msgSend(v13, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (void)obtainParentsForCurrentContact:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE30A88]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__SCUIContactParentsHelper_obtainParentsForCurrentContact___block_invoke;
  v6[3] = &unk_2516EC820;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "startRequestWithCompletionHandler:", v6);

}

void __59__SCUIContactParentsHelper_obtainParentsForCurrentContact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  _BOOL8 v18;
  void *v19;
  NSObject *v20;
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
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  _QWORD v47[3];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v40 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDE96D0], "clientUI");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      __59__SCUIContactParentsHelper_obtainParentsForCurrentContact___block_invoke_cold_1((uint64_t)v6, v35);

LABEL_31:
    v34 = *(_QWORD *)(a1 + 32);
LABEL_32:
    (*(void (**)(uint64_t, _QWORD))(v34 + 16))(v34, 0);
    goto LABEL_33;
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v5, "members");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (!v8)
  {

    goto LABEL_31;
  }
  v9 = v8;
  v37 = a1;
  v38 = v6;
  v39 = v5;
  v10 = 0;
  v11 = *(_QWORD *)v43;
  v12 = 0x24BDE9000uLL;
  v41 = *(_QWORD *)v43;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v43 != v11)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v13);
      if (!objc_msgSend(v14, "isMe"))
      {
        if (!objc_msgSend(v14, "isParent"))
          goto LABEL_20;
        v18 = v10;
        v19 = v7;
        objc_msgSend(*(id *)(v12 + 1744), "clientUI");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v47[0] = v14;
          _os_log_impl(&dword_245CB6000, v20, OS_LOG_TYPE_DEFAULT, "Found parent: %@", buf, 0xCu);
        }

        objc_msgSend(v14, "contact");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "phoneNumbers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "firstObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "value");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringValue");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "contact");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "emailAddresses");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "firstObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "value");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v25, "length"))
        {
          objc_msgSend(v40, "addObject:", v25);
          v7 = v19;
          goto LABEL_18;
        }
        v7 = v19;
        if (objc_msgSend(v29, "length"))
        {
          objc_msgSend(v40, "addObject:", v29);
LABEL_18:
          v10 = v18;
        }
        else
        {
          objc_msgSend(v14, "appleID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "length");

          v10 = v18;
          if (v31)
          {
            objc_msgSend(v14, "appleID");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "addObject:", v32);

          }
        }

        v12 = 0x24BDE9000;
        v11 = v41;
        goto LABEL_20;
      }
      objc_msgSend(*(id *)(v12 + 1744), "clientUI");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = objc_msgSend(v14, "memberType");
        v17 = objc_msgSend(v14, "age");
        *(_DWORD *)buf = 67109376;
        LODWORD(v47[0]) = v16;
        WORD2(v47[0]) = 2048;
        *(_QWORD *)((char *)v47 + 6) = v17;
        _os_log_impl(&dword_245CB6000, v15, OS_LOG_TYPE_DEFAULT, "Found current member of type: %d (%lu)", buf, 0x12u);
      }

      v10 = objc_msgSend(v14, "memberType") != -1;
LABEL_20:
      ++v13;
    }
    while (v9 != v13);
    v33 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    v9 = v33;
  }
  while (v33);

  v6 = v38;
  v34 = *(_QWORD *)(v37 + 32);
  if (!v10)
  {
    v5 = v39;
    goto LABEL_32;
  }
  v36 = (void *)objc_msgSend(v40, "copy");
  (*(void (**)(uint64_t, void *))(v34 + 16))(v34, v36);

  v5 = v39;
LABEL_33:

}

void __59__SCUIContactParentsHelper_obtainParentsForCurrentContact___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_245CB6000, a2, OS_LOG_TYPE_ERROR, "Error fetching FamilyCircle: %@", (uint8_t *)&v2, 0xCu);
}

@end
