@implementation SPCoreSpotlightContactsUpdater

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_7);
  return (id)sharedInstance_updater;
}

void __48__SPCoreSpotlightContactsUpdater_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_updater;
  sharedInstance_updater = v0;

}

- (SPCoreSpotlightContactsUpdater)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SPCoreSpotlightContactsUpdater;
  return -[SPCoreSpotlightContactsUpdater init](&v3, sel_init);
}

- (id)updatedCountsFromExisting:(id)a3 result:(int64_t *)a4 shouldUpdateMonth:(BOOL)a5
{
  _BOOL4 v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[5];

  v5 = a5;
  v23[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(v6, "count") == 4)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue");

    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedIntegerValue");

    v15 = v10 >> 2;
    if (!v5)
      v15 = 0;
    v16 = v15 + v8;
    v17 = v10 - v15 + v12 / 7;
    v23[0] = &unk_24D0FD2D0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12 - ((4 * (v12 / 7)) >> 2) + v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v18;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v19;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)updateContactCounts:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  _QWORD v30[5];
  id v31;
  NSObject *v32;
  uint64_t v33;
  uint8_t buf[4];
  NSObject *v35;
  const __CFString *v36;
  _QWORD v37[2];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v28 = a3;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setInternal:", 1);
  v27 = *MEMORY[0x24BDC1E28];
  v4 = *MEMORY[0x24BDC1E28];
  v37[0] = *MEMORY[0x24BDC22E8];
  v37[1] = v4;
  v25 = *MEMORY[0x24BDC1E38];
  v5 = *MEMORY[0x24BDC1E38];
  v38 = *MEMORY[0x24BDC1FC0];
  v26 = v38;
  v39 = v5;
  v7 = *MEMORY[0x24BDC1E40];
  v40 = *MEMORY[0x24BDC1FD0];
  v6 = v40;
  v41 = v7;
  v9 = *MEMORY[0x24BDC1E20];
  v42 = *MEMORY[0x24BDC1FD8];
  v8 = v42;
  v43 = v9;
  v11 = *MEMORY[0x24BDC1E30];
  v44 = *MEMORY[0x24BDC1FB8];
  v10 = v44;
  v45 = v11;
  v13 = *MEMORY[0x24BDC1BB8];
  v46 = *MEMORY[0x24BDC1FC8];
  v12 = v46;
  v47 = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchAttributes:", v14);

  v36 = CFSTR("com.apple.MobileAddressBook");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBundleIDs:", v15);

  objc_msgSend(v3, "fetchAttributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("((%@=\"*\") || (%@=\"*\") || (%@=\"*\") || (%@=\"*\") || (%@=\"*\") || (%@=\"*\") || (%@=\"*\") || (%@=\"*\") || (%@=\"*\") || (%@=\"*\")) && ((%@!=\"*\") || (%@<$time.now(-1d)))"), v27, v26, v25, v6, v7, v8, v9, v10, v11, v12, *MEMORY[0x24BDC1BB0], *MEMORY[0x24BDC1BB0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  logForCSLogCategoryDefault();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v35 = v28;
    _os_log_impl(&dword_213CF1000, v20, OS_LOG_TYPE_INFO, "3 Enter group %p", buf, 0xCu);
  }

  if (v28)
    dispatch_group_enter(v28);
  +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __54__SPCoreSpotlightContactsUpdater_updateContactCounts___block_invoke;
  v30[3] = &unk_24D0EDB08;
  v33 = v17;
  v30[4] = self;
  v31 = v19;
  v22 = v28;
  v32 = v22;
  v23 = v19;
  objc_msgSend(v21, "startQuery:withContext:handler:", v18, v3, v30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28 && !v24)
    dispatch_group_leave(v22);

}

void __54__SPCoreSpotlightContactsUpdater_updateContactCounts___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a6;
  if (a2 == 1)
  {
    logForCSLogCategoryDefault();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134217984;
      v26 = v19;
      _os_log_impl(&dword_213CF1000, v18, OS_LOG_TYPE_INFO, "3 Leave group %p", buf, 0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
  else if (!a2)
  {
    v10 = (void *)objc_opt_new();
    v11 = *(_QWORD *)(a1 + 56);
    v12 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __54__SPCoreSpotlightContactsUpdater_updateContactCounts___block_invoke_2;
    v22[3] = &unk_24D0EDAE0;
    v13 = *(void **)(a1 + 40);
    v22[4] = *(_QWORD *)(a1 + 32);
    v23 = v13;
    v14 = v10;
    v24 = v14;
    objc_msgSend(a5, "enumerateQueryResults:stringCache:usingBlock:", v11, 0, v22);
    logForCSLogCategoryDefault();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134217984;
      v26 = v16;
      _os_log_impl(&dword_213CF1000, v15, OS_LOG_TYPE_INFO, "4 Enter group %p", buf, 0xCu);
    }

    dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
    +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __54__SPCoreSpotlightContactsUpdater_updateContactCounts___block_invoke_16;
    v20[3] = &unk_24D0EB060;
    v21 = *(id *)(a1 + 48);
    objc_msgSend(v17, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:completionHandler:", v14, 0, 0, 0, CFSTR("com.apple.MobileAddressBook"), 0, v20);

  }
}

void __54__SPCoreSpotlightContactsUpdater_updateContactCounts___block_invoke_2(uint64_t a1, id *a2)
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  _BOOL8 v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
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
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  _QWORD v77[3];

  v77[1] = *MEMORY[0x24BDAC8D0];
  v46 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v53 = a2[4];
  v7 = a2[5];
  v8 = a2[6];
  v52 = a2[7];
  v51 = a2[8];
  v50 = a2[9];
  v49 = a2[10];
  v48 = a2[11];
  objc_msgSend(v48, "timeIntervalSinceNow");
  v10 = v9;
  v11 = v9 > 604800.0;
  v12 = objc_alloc_init(MEMORY[0x24BDC2480]);
  v45 = v4;
  objc_msgSend(*(id *)(a1 + 32), "updatedCountsFromExisting:result:shouldUpdateMonth:", v4, 0, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v5;
  objc_msgSend(*(id *)(a1 + 32), "updatedCountsFromExisting:result:shouldUpdateMonth:", v5, 0, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    v76 = *MEMORY[0x24BDC1E28];
    v77[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v77, &v76, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAttributesFromDictionary:", v15);

  }
  if (objc_msgSend(v14, "count"))
  {
    v74 = *MEMORY[0x24BDC1FC0];
    v75 = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAttributesFromDictionary:", v16);

  }
  v17 = v6;
  objc_msgSend(*(id *)(a1 + 32), "updatedCountsFromExisting:result:shouldUpdateMonth:", v6, 0, v10 > 604800.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "updatedCountsFromExisting:result:shouldUpdateMonth:", v53, 0, v10 > 604800.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count"))
  {
    v72 = *MEMORY[0x24BDC1E38];
    v73 = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAttributesFromDictionary:", v19);

  }
  if (objc_msgSend(v47, "count", v18))
  {
    v70 = *MEMORY[0x24BDC1FD0];
    v71 = v47;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAttributesFromDictionary:", v20);

  }
  v42 = v7;
  objc_msgSend(*(id *)(a1 + 32), "updatedCountsFromExisting:result:shouldUpdateMonth:", v7, 0, v10 > 604800.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v8;
  objc_msgSend(*(id *)(a1 + 32), "updatedCountsFromExisting:result:shouldUpdateMonth:", v8, 0, v10 > 604800.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "count"))
  {
    v68 = *MEMORY[0x24BDC1E40];
    v69 = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAttributesFromDictionary:", v23);

  }
  v39 = v14;
  v40 = v13;
  if (objc_msgSend(v22, "count"))
  {
    v66 = *MEMORY[0x24BDC1FD8];
    v67 = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAttributesFromDictionary:", v24);

  }
  objc_msgSend(*(id *)(a1 + 32), "updatedCountsFromExisting:result:shouldUpdateMonth:", v52, 0, v10 > 604800.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "updatedCountsFromExisting:result:shouldUpdateMonth:", v51, 0, v10 > 604800.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "count"))
  {
    v64 = *MEMORY[0x24BDC1E20];
    v65 = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAttributesFromDictionary:", v27);

  }
  v43 = v17;
  if (objc_msgSend(v26, "count"))
  {
    v62 = *MEMORY[0x24BDC1FB8];
    v63 = v26;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAttributesFromDictionary:", v28);

  }
  objc_msgSend(*(id *)(a1 + 32), "updatedCountsFromExisting:result:shouldUpdateMonth:", v50, 0, v10 > 604800.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "updatedCountsFromExisting:result:shouldUpdateMonth:", v49, 0, v10 > 604800.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "count"))
  {
    v60 = *MEMORY[0x24BDC1E30];
    v61 = v29;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAttributesFromDictionary:", v31);

  }
  if (objc_msgSend(v30, "count"))
  {
    v58 = *MEMORY[0x24BDC1FC8];
    v59 = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAttributesFromDictionary:", v32);

  }
  if (!v48 || v10 > 604800.0)
  {
    v33 = *(_QWORD *)(a1 + 40);
    v56 = *MEMORY[0x24BDC1BB8];
    v57 = v33;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAttributesFromDictionary:", v34);

  }
  v35 = *(_QWORD *)(a1 + 40);
  v54 = *MEMORY[0x24BDC1BB0];
  v55 = v35;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAttributesFromDictionary:", v36);

  v37 = objc_alloc_init(MEMORY[0x24BDC2478]);
  objc_msgSend(v37, "setUniqueIdentifier:", v46);
  objc_msgSend(v37, "setIsUpdate:", 1);
  objc_msgSend(v37, "setAttributeSet:", v12);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v37);

}

void __54__SPCoreSpotlightContactsUpdater_updateContactCounts___block_invoke_16(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 134217984;
    v5 = v3;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_INFO, "4 Leave group %p", (uint8_t *)&v4, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end
