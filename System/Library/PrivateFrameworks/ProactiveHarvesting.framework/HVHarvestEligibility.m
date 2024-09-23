@implementation HVHarvestEligibility

+ (BOOL)searchableItemIsEligibleForDeferredHarvesting:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (searchableItemIsEligibleForDeferredHarvesting__onceToken != -1)
    dispatch_once(&searchableItemIsEligibleForDeferredHarvesting__onceToken, &__block_literal_global_1484);
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v4 = (void *)searchableItemIsEligibleForDeferredHarvesting__bundleIds;
    objc_msgSend(v3, "bundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  }
  return (char)v4;
}

+ (BOOL)searchableItemIsEligibleForDissectorPipeline:(id)a3 targetPluginsCustomAttributeName:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char v10;
  BOOL v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "bundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.mobilemail"));

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v7, "bundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

    if (!v13)
    {
      v11 = 0;
      goto LABEL_12;
    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC23C0]), "initWithKeyName:", v8);
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HVHarvestEligibility.m"), 67, CFSTR("initWithKeyName failed for expected valid key: %@"), v8);

    }
    objc_msgSend(v7, "attributeSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valueForCustomKey:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v16, "count"))
    {
      objc_msgSend(v7, "domainIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v11 = 1;
        goto LABEL_11;
      }
      hv_default_log_handle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v7, "bundleID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "uniqueIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v24 = v20;
        v25 = 2112;
        v26 = v21;
        _os_log_fault_impl(&dword_21AA1D000, v19, OS_LOG_TYPE_FAULT, "Got a Message with a nil domainIdentifier (bundleID=%@, uniqueIdentifier=%@)", buf, 0x16u);

      }
    }
    v11 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v11 = 1;
LABEL_12:

  return v11;
}

+ (BOOL)searchableItemIsEligibleForHarvesting:(id)a3 eligibleExceptForAge:(BOOL *)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __83__HVHarvestEligibility_searchableItemIsEligibleForHarvesting_eligibleExceptForAge___block_invoke;
  v10[3] = &unk_24DD7F1E8;
  v11 = v6;
  v7 = v6;
  objc_msgSend(v7, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(a1, "searchableItemIsEligibleForHarvestingWithGetterBlock:bundleIdentifier:eligibleExceptForAge:", v10, v8, a4);

  return (char)a4;
}

+ (BOOL)searchableItemIsStoredEncryptedWithGetterBlock:(id)a3 bundleIdentifier:(id)a4
{
  return 0;
}

+ (BOOL)searchableItemIsEligibleForHarvestingWithGetterBlock:(id)a3 bundleIdentifier:(id)a4 eligibleExceptForAge:(BOOL *)a5
{
  id v9;
  id v10;
  char v11;
  id v12;
  uint64_t v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  void *v16;
  void *v18;
  _QWORD block[5];

  v9 = a3;
  v10 = a4;
  if (a5)
    *a5 = 0;
  if ((objc_msgSend(a1, "searchableItemIsStoredEncryptedWithGetterBlock:bundleIdentifier:", v9, v10) & 1) == 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __115__HVHarvestEligibility_searchableItemIsEligibleForHarvestingWithGetterBlock_bundleIdentifier_eligibleExceptForAge___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (searchableItemIsEligibleForHarvestingWithGetterBlock_bundleIdentifier_eligibleExceptForAge___pasOnceToken5 != -1)
      dispatch_once(&searchableItemIsEligibleForHarvestingWithGetterBlock_bundleIdentifier_eligibleExceptForAge___pasOnceToken5, block);
    v12 = (id)searchableItemIsEligibleForHarvestingWithGetterBlock_bundleIdentifier_eligibleExceptForAge___pasExprOnceResult;
    if (v10 && objc_msgSend(v10, "length"))
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", v10);
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("_thirdpartyonly_"));
        v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id, id))v14)[2](v14, v9, v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = 0;
        goto LABEL_13;
      }
    }
    else
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("_thirdpartyonly_"));
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v13;
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v9, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

    if (v15)
    {
      if (!a5)
      {
LABEL_16:
        v11 = objc_msgSend(v15, "isEligible");

        goto LABEL_17;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HVHarvestEligibility.m"), 136, CFSTR("result unexpectedly nil"));

      if (!a5)
        goto LABEL_16;
    }
    *a5 = objc_msgSend(v15, "isEligibleExceptForAge");
    goto LABEL_16;
  }
  v11 = 0;
LABEL_17:

  return v11;
}

void __115__HVHarvestEligibility_searchableItemIsEligibleForHarvestingWithGetterBlock_bundleIdentifier_eligibleExceptForAge___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[6];
  _QWORD v6[8];
  _QWORD v7[9];

  v7[8] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x22074FDF0]();
  v6[0] = CFSTR("com.apple.mobilemail");
  v1 = objc_opt_self();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__HVHarvestEligibility_mailAppItemEligibilityCheckBlock__block_invoke;
  v5[3] = &__block_descriptor_48_e71___HVEligibilityCheckResult_24__0_____CSSearchableItem____8__NSString_16l;
  v5[4] = sel_mailAppItemEligibilityCheckBlock;
  v5[5] = v1;
  v2 = (void *)MEMORY[0x22074FF64](v5);
  v7[0] = v2;
  v6[1] = CFSTR("com.apple.MobileSMS");
  objc_opt_self();
  v7[1] = &__block_literal_global_34;
  v6[2] = CFSTR("com.apple.news");
  objc_opt_self();
  v7[2] = &__block_literal_global_35;
  v6[3] = CFSTR("com.apple.mobilesafari");
  objc_opt_self();
  v7[3] = &__block_literal_global_35;
  v6[4] = CFSTR("com.apple.mobilenotes");
  objc_opt_self();
  v7[4] = &__block_literal_global_35;
  v6[5] = CFSTR("com.apple.reminders");
  objc_opt_self();
  v7[5] = &__block_literal_global_35;
  v6[6] = CFSTR("com.apple.usernotificationsd");
  objc_opt_self();
  v7[6] = &__block_literal_global_35;
  v6[7] = CFSTR("_thirdpartyonly_");
  objc_opt_self();
  v7[7] = &__block_literal_global_40;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 8);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)searchableItemIsEligibleForHarvestingWithGetterBlock_bundleIdentifier_eligibleExceptForAge___pasExprOnceResult;
  searchableItemIsEligibleForHarvestingWithGetterBlock_bundleIdentifier_eligibleExceptForAge___pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v0);
}

id __51__HVHarvestEligibility_thirdPartyOnlyEligibleBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void (**v4)(_QWORD);
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.")))
  {
    hv_default_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_21AA1D000, v6, OS_LOG_TYPE_DEFAULT, "HVHarvestEligibility: items from unsupported first-party bundle %@ are not eligible", (uint8_t *)&v12, 0xCu);
    }

    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setIsEligible:", 0);
    objc_msgSend(v7, "setIsEligibleExceptForAge:", 0);
  }
  else
  {
    v4[2](v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    hv_default_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "uniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_21AA1D000, v9, OS_LOG_TYPE_DEFAULT, "HVHarvestEligibility: item %@ from bundle %@ is eligible", (uint8_t *)&v12, 0x16u);

    }
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setIsEligible:", 1);
    objc_msgSend(v7, "setIsEligibleExceptForAge:", 0);

  }
  return v7;
}

id __60__HVHarvestEligibility_supportedFirstPartyItemEligibleBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void (**v4)(_QWORD);
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  if ((objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.")) & 1) == 0)
    __assert_rtn("+[HVHarvestEligibility supportedFirstPartyItemEligibleBlock]_block_invoke", "HVHarvestEligibility.m", 226, "[bundleIdentifier hasPrefix:@\"com.apple.\"]");
  v4[2](v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  hv_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_21AA1D000, v7, OS_LOG_TYPE_DEFAULT, "HVHarvestEligibility: first-party item %@ from bundle %@ is eligible", (uint8_t *)&v12, 0x16u);

  }
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setIsEligible:", 1);
  objc_msgSend(v10, "setIsEligibleExceptForAge:", 0);

  return v10;
}

id __60__HVHarvestEligibility_messagesAppItemEligibilityCheckBlock__block_invoke()
{
  void *v0;
  NSObject *v1;
  uint8_t v3[16];

  v0 = (void *)objc_opt_new();
  hv_default_log_handle();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21AA1D000, v1, OS_LOG_TYPE_INFO, "HVHarvestEligibility: skipping Messages item from Spotlight since Messages donations use a custom donation SPI.", v3, 2u);
  }

  objc_msgSend(v0, "setIsEligible:", 0);
  objc_msgSend(v0, "setIsEligibleExceptForAge:", 0);
  return v0;
}

id __56__HVHarvestEligibility_mailAppItemEligibilityCheckBlock__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  (*(void (**)(uint64_t))(a2 + 16))(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && (objc_msgSend((id)*MEMORY[0x24BDF8398], "conformsToType:", v7) & 1) != 0)
    {
      objc_msgSend(v3, "attributeSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "emailHeaders");
      v9 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "attributeSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mailboxIdentifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!+[HVSearchableItemHelper mailItemIsValid:emailHeaders:mailboxIdentifiers:](HVSearchableItemHelper, "mailItemIsValid:emailHeaders:mailboxIdentifiers:", v3, v9, v11)|| !+[HVSearchableItemHelper mailItemIsFromSupportedAccount:](HVSearchableItemHelper, "mailItemIsFromSupportedAccount:", v3))
      {
        hv_default_log_handle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
LABEL_16:

          goto LABEL_17;
        }
        objc_msgSend(v3, "uniqueIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v14;
        v15 = "HVHarvestEligibility: skipping invalid searchable item: %@";
LABEL_15:
        _os_log_impl(&dword_21AA1D000, v13, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);

        goto LABEL_16;
      }
      if (!v9)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("HVHarvestEligibility.m"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("emailHeaders"));

      }
      v12 = +[HVContentAdmission suggestionsShouldShowPastEvents](HVContentAdmission, "suggestionsShouldShowPastEvents")|| +[HVSearchableItemHelper mailItemIsRecent:emailHeaders:](HVSearchableItemHelper, "mailItemIsRecent:emailHeaders:", v3, v9);
      if (+[HVSearchableItemHelper mailItemIsSPAM:emailHeaders:mailboxIdentifiers:](HVSearchableItemHelper, "mailItemIsSPAM:emailHeaders:mailboxIdentifiers:", v3, v9, v11)|| +[HVSearchableItemHelper mailItemIsInDrafts:mailboxIdentifiers:](HVSearchableItemHelper, "mailItemIsInDrafts:mailboxIdentifiers:", v3, v11)|| +[HVSearchableItemHelper mailItemIsInTrash:mailboxIdentifiers:](HVSearchableItemHelper, "mailItemIsInTrash:mailboxIdentifiers:", v3, v11))
      {
        v17 = 1;
        if (v12)
        {
LABEL_24:
          if (!v17)
          {
            objc_msgSend(v4, "setIsEligible:", 1);
            goto LABEL_17;
          }
          hv_default_log_handle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            goto LABEL_16;
          objc_msgSend(v3, "uniqueIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v24 = v14;
          v15 = "HVHarvestEligibility: skipping ignorable searchable item: %@";
          goto LABEL_15;
        }
      }
      else
      {
        v17 = +[HVSearchableItemHelper mailItemIsTooBig:](HVSearchableItemHelper, "mailItemIsTooBig:", v3);
        if (v12)
          goto LABEL_24;
      }
      hv_default_log_handle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "uniqueIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v19;
        _os_log_impl(&dword_21AA1D000, v18, OS_LOG_TYPE_DEFAULT, "HVHarvestEligibility: skipping ignorable searchable item: %@", buf, 0xCu);

      }
      if (!v17)
      {
        hv_default_log_handle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v3, "uniqueIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v24 = v21;
          _os_log_impl(&dword_21AA1D000, v20, OS_LOG_TYPE_DEFAULT, "HVHarvestEligibility: item is not recent but otherwise eligible: %@", buf, 0xCu);

        }
        objc_msgSend(v4, "setIsEligibleExceptForAge:", 1);
      }
      goto LABEL_17;
    }
  }
  else
  {
    v7 = 0;
  }
  hv_default_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v24 = v11;
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_21AA1D000, v9, OS_LOG_TYPE_INFO, "HVHarvestEligibility: skipping mail app item %@ with non-email type %@", buf, 0x16u);
LABEL_17:

  }
  return v4;
}

id __83__HVHarvestEligibility_searchableItemIsEligibleForHarvesting_eligibleExceptForAge___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __70__HVHarvestEligibility_searchableItemIsEligibleForDeferredHarvesting___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x22074FDF0]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("com.apple.news"), CFSTR("com.apple.mobilesafari"), CFSTR("com.apple.mobilenotes"), CFSTR("com.apple.reminders"), 0);
  objc_autoreleasePoolPop(v0);
  v2 = (void *)searchableItemIsEligibleForDeferredHarvesting__bundleIds;
  searchableItemIsEligibleForDeferredHarvesting__bundleIds = v1;

}

@end
