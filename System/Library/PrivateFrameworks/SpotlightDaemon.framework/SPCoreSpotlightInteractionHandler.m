@implementation SPCoreSpotlightInteractionHandler

- (void)handleInteraction:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  objc_msgSend(v6, "intent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCoreSpotlightInteractionHandler interestingContactIdentifiersFromIntent:](self, "interestingContactIdentifiersFromIntent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[SPCoreSpotlightInteractionHandler attributeForIntent:direction:](self, "attributeForIntent:direction:", v7, objc_msgSend(v6, "direction"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (handleInteraction_bundleID_protectionClass__onceToken != -1)
        dispatch_once(&handleInteraction_bundleID_protectionClass__onceToken, &__block_literal_global_2);
      v10 = handleInteraction_bundleID_protectionClass__helperQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __80__SPCoreSpotlightInteractionHandler_handleInteraction_bundleID_protectionClass___block_invoke_2;
      block[3] = &unk_24D0EA8C0;
      v12 = v6;
      v13 = v9;
      v14 = v8;
      dispatch_async(v10, block);

    }
  }

}

- (id)interestingContactIdentifiersFromIntent:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setNumberStyle:", 1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "contacts");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_4:
    v6 = (void *)v5;
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "recipients");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  v6 = 0;
LABEL_5:
  v7 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "contactIdentifier", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)attributeForIntent:(id)a3 direction:(int64_t)a4
{
  id v5;
  id *v6;
  id v7;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a4 == 2)
    {
      v6 = (id *)MEMORY[0x24BDC1E18];
      goto LABEL_14;
    }
    if (a4 == 1)
    {
      v6 = (id *)MEMORY[0x24BDC1FB0];
LABEL_14:
      v7 = *v6;
      goto LABEL_15;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (a4 == 2)
      {
        v6 = (id *)MEMORY[0x24BDC1E48];
        goto LABEL_14;
      }
      if (a4 == 1)
      {
        v6 = (id *)MEMORY[0x24BDC1FE0];
        goto LABEL_14;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = (id *)MEMORY[0x24BDC1FC0];
        goto LABEL_14;
      }
    }
  }
  v7 = 0;
LABEL_15:

  return v7;
}

void __80__SPCoreSpotlightInteractionHandler_handleInteraction_bundleID_protectionClass___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.corespotlight.interactionhelper", v0);
  v2 = (void *)handleInteraction_bundleID_protectionClass__helperQueue;
  handleInteraction_bundleID_protectionClass__helperQueue = (uint64_t)v1;

}

void __80__SPCoreSpotlightInteractionHandler_handleInteraction_bundleID_protectionClass___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "dateInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)SICopyRoundedDate();
  v5 = *MEMORY[0x24BDC1FC0];
  if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *MEMORY[0x24BDC1FC0]))
  {
    v6 = *MEMORY[0x24BDC1FD8];
    v25[0] = v5;
    v25[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }
  logForCSLogCategoryDefault();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_213CF1000, v8, OS_LOG_TYPE_INFO, "adding contacts interaction %@ identifiers %@", buf, 0x16u);
  }

  +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BDD0CE0];
  v13 = *(void **)(a1 + 48);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __80__SPCoreSpotlightInteractionHandler_handleInteraction_bundleID_protectionClass___block_invoke_9;
  v16[3] = &unk_24D0EA898;
  v17 = v13;
  v18 = *(id *)(a1 + 40);
  v19 = v3;
  v20 = v4;
  v14 = v4;
  v15 = v3;
  objc_msgSend(v11, "fetchAttributesForProtectionClass:attributes:bundleID:identifiers:completion:", v12, v7, CFSTR("com.apple.MobileAddressBook"), v17, v16);

}

void __80__SPCoreSpotlightInteractionHandler_handleInteraction_bundleID_protectionClass___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[3];
  _QWORD v46[3];
  uint8_t buf[4];
  uint64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
  if (v4)
  {
    v5 = v4;
    v37 = *(_QWORD *)v39;
    v35 = *MEMORY[0x24BDC1FC0];
    v34 = *MEMORY[0x24BDC1EE8];
    v31 = *MEMORY[0x24BDC1FD8];
    v32 = (void *)*MEMORY[0x24BDBD430];
    v30 = v3;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v39 != v37)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v9 = objc_opt_new();
          -[NSObject setBundleID:](v9, "setBundleID:", CFSTR("com.apple.MobileAddressBook"));
          -[NSObject setUniqueIdentifier:](v9, "setUniqueIdentifier:", v7);
          -[NSObject setIsUpdate:](v9, "setIsUpdate:", 1);
          if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", v35))
          {
            objc_msgSend(v3, "objectForKey:", v7);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v10;
            if (v10)
            {
              objc_msgSend(v10, "firstObject");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "objectAtIndex:", 1);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (v12 && v12 != v32)
              {
                v14 = (void *)objc_msgSend(v12, "mutableCopy");
                v15 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "numberWithUnsignedLongLong:", objc_msgSend(v16, "unsignedLongLongValue") + 1);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "setObject:atIndexedSubscript:", v17, 0);

                v3 = v30;
                v18 = (void *)objc_msgSend(v14, "copy");

                v12 = v14;
LABEL_17:

                if (!v13 || v13 == v32)
                {
                  v20 = &unk_24D0FCEE0;
                }
                else
                {
                  v22 = (void *)objc_msgSend(v13, "mutableCopy");
                  v23 = (void *)MEMORY[0x24BDD16E0];
                  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "numberWithUnsignedLongLong:", objc_msgSend(v24, "unsignedLongLongValue") + 1);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "setObject:atIndexedSubscript:", v25, 0);

                  v3 = v30;
                  v20 = (void *)objc_msgSend(v22, "copy");

                  v13 = v22;
                }

                v26 = objc_alloc(MEMORY[0x24BDC2480]);
                v27 = *(_QWORD *)(a1 + 48);
                v45[0] = *(_QWORD *)(a1 + 40);
                v45[1] = v31;
                v46[0] = v18;
                v46[1] = v20;
                v45[2] = v34;
                v46[2] = v27;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = (void *)objc_msgSend(v26, "initWithAttributes:", v21);
                -[NSObject setAttributeSet:](v9, "setAttributeSet:", v28);

LABEL_22:
                objc_msgSend(v36, "addObject:", v9);
                goto LABEL_23;
              }
            }
            else
            {
              v12 = 0;
              v13 = 0;
            }
            v18 = &unk_24D0FCEC8;
            goto LABEL_17;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(":A:%@"), *(_QWORD *)(a1 + 40));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_alloc(MEMORY[0x24BDC2480]);
          v42 = *(_QWORD *)(a1 + 56);
          v43[0] = v11;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v42, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v43[1] = v34;
          v44[0] = v18;
          v44[1] = *(_QWORD *)(a1 + 48);
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v19, "initWithAttributes:", v20);
          -[NSObject setAttributeSet:](v9, "setAttributeSet:", v21);
          goto LABEL_22;
        }
        logForCSLogCategoryDefault();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v48 = v7;
          _os_log_impl(&dword_213CF1000, v9, OS_LOG_TYPE_DEFAULT, "interaction-related identifier not indexed %@", buf, 0xCu);
        }
LABEL_23:

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
    }
    while (v5);
  }

  +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:clientStateName:protectionClass:forBundleID:options:completionHandler:", v36, 0, 0, 0, *MEMORY[0x24BDD0CE0], CFSTR("com.apple.MobileAddressBook"), 0, 0);

}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
