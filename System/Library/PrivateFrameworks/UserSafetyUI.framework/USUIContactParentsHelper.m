@implementation USUIContactParentsHelper

+ (void)openChatWithParentsForInterventionType:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 1)
      dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global);
  }
  else
  {
    +[USUIContactParentsHelper obtainParentsForCurrentContact:](USUIContactParentsHelper, "obtainParentsForCurrentContact:", &__block_literal_global_13);
  }
}

void __67__USUIContactParentsHelper_openChatWithParentsForInterventionType___block_invoke()
{
  id v0;

  +[USUIContactParentsHelper urlFromAddressList:](USUIContactParentsHelper, "urlFromAddressList:", 0);
  v0 = (id)objc_claimAutoreleasedReturnValue();
  +[USUIContactParentsHelper openChatWithURL:](USUIContactParentsHelper, "openChatWithURL:", v0);

}

void __67__USUIContactParentsHelper_openChatWithParentsForInterventionType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _QWORD block[4];
  id v5;

  v2 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__USUIContactParentsHelper_openChatWithParentsForInterventionType___block_invoke_3;
  block[3] = &unk_251B16B10;
  v5 = v2;
  v3 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __67__USUIContactParentsHelper_openChatWithParentsForInterventionType___block_invoke_3(uint64_t a1)
{
  id v1;

  +[USUIContactParentsHelper urlFromAddressList:](USUIContactParentsHelper, "urlFromAddressList:", *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  +[USUIContactParentsHelper openChatWithURL:](USUIContactParentsHelper, "openChatWithURL:", v1);

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
      +[USUIContactParentsHelper urlFromAddressList:](USUIContactParentsHelper, "urlFromAddressList:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v6)[2](v6, v7);

    }
  }
  else
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __90__USUIContactParentsHelper_obtainChatWithParentsURLForInterventionType_completionHandler___block_invoke;
    v8[3] = &unk_251B16B38;
    v9 = v5;
    +[USUIContactParentsHelper obtainParentsForCurrentContact:](USUIContactParentsHelper, "obtainParentsForCurrentContact:", v8);

  }
}

void __90__USUIContactParentsHelper_obtainChatWithParentsURLForInterventionType_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  +[USUIContactParentsHelper urlFromAddressList:](USUIContactParentsHelper, "urlFromAddressList:", a2);
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
  objc_msgSend(MEMORY[0x24BE853F8], "localizedStringForKey:", CFSTR("MESSAGE_GROWNUP_BODY"));
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
  v6[2] = __59__USUIContactParentsHelper_obtainParentsForCurrentContact___block_invoke;
  v6[3] = &unk_251B16B60;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "startRequestWithCompletionHandler:", v6);

}

void __59__USUIContactParentsHelper_obtainParentsForCurrentContact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
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
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;
  _BOOL4 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  _QWORD v44[3];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v37 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BEBFA10], "clientUI");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      __59__USUIContactParentsHelper_obtainParentsForCurrentContact___block_invoke_cold_1((uint64_t)v6, v32);

    goto LABEL_26;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v5, "members");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (!v8)
  {

LABEL_26:
    v31 = *(_QWORD *)(a1 + 32);
    goto LABEL_27;
  }
  v9 = v8;
  v34 = a1;
  v35 = v6;
  v36 = v5;
  v10 = 0;
  v11 = *(_QWORD *)v40;
  v12 = 0x24BEBF000uLL;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v40 != v11)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
      if (objc_msgSend(v14, "isMe"))
      {
        objc_msgSend(*(id *)(v12 + 2576), "clientUI");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = objc_msgSend(v14, "memberType");
          v17 = objc_msgSend(v14, "age");
          *(_DWORD *)buf = 67109376;
          LODWORD(v44[0]) = v16;
          WORD2(v44[0]) = 2048;
          *(_QWORD *)((char *)v44 + 6) = v17;
          _os_log_impl(&dword_249BA8000, v15, OS_LOG_TYPE_DEFAULT, "Found current member of type: %d (%lu)", buf, 0x12u);
        }

        v10 = objc_msgSend(v14, "memberType") != -1;
      }
      else if (objc_msgSend(v14, "isParent"))
      {
        v38 = v10;
        objc_msgSend(*(id *)(v12 + 2576), "clientUI");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v44[0] = v14;
          _os_log_impl(&dword_249BA8000, v18, OS_LOG_TYPE_DEFAULT, "Found parent: %@", buf, 0xCu);
        }

        objc_msgSend(v14, "contact");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "phoneNumbers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "value");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringValue");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "contact");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "emailAddresses");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "firstObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "value");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = objc_msgSend(v23, "length");
        v29 = v23;
        if (v28 || (v30 = objc_msgSend(v27, "length", v23), v29 = v27, v30))
          objc_msgSend(v37, "addObject:", v29);

        v12 = 0x24BEBF000;
        v10 = v38;
      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  }
  while (v9);

  v6 = v35;
  v31 = *(_QWORD *)(v34 + 32);
  if (v10)
  {
    v33 = (void *)objc_msgSend(v37, "copy");
    (*(void (**)(uint64_t, void *))(v31 + 16))(v31, v33);

    v5 = v36;
    goto LABEL_28;
  }
  v5 = v36;
LABEL_27:
  (*(void (**)(uint64_t, _QWORD))(v31 + 16))(v31, 0);
LABEL_28:

}

void __59__USUIContactParentsHelper_obtainParentsForCurrentContact___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_249BA8000, a2, OS_LOG_TYPE_ERROR, "Error fetching FamilyCircle: %@", (uint8_t *)&v2, 0xCu);
}

@end
