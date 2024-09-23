@implementation ICQUICoreSpotlightQueryHelper

+ (void)updateThresholdsForLargeFilesWithDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "thresholdsForLargeFiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__ICQUICoreSpotlightQueryHelper_updateThresholdsForLargeFilesWithDictionary___block_invoke;
  v7[3] = &unk_24E3F42D8;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

}

uint64_t __77__ICQUICoreSpotlightQueryHelper_updateThresholdsForLargeFilesWithDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a3, a2);
}

+ (id)thresholdsForLargeFiles
{
  if (thresholdsForLargeFiles_onceToken != -1)
    dispatch_once(&thresholdsForLargeFiles_onceToken, &__block_literal_global_10);
  return (id)thresholdsForLargeFiles_thresholds;
}

void __56__ICQUICoreSpotlightQueryHelper_thresholdsForLargeFiles__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)thresholdsForLargeFiles_thresholds;
  thresholdsForLargeFiles_thresholds = v0;

}

+ (id)defaultFetchedAttributes
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDC2390];
  v7[0] = *MEMORY[0x24BDC1D40];
  v7[1] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC82D8], "fp_queryFetchAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)queryForMinimumSizeInMegabytes:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@ = \"%@\" || %@ = \"%@\") && (%@ != \"1\") && (%@ > %@)"), *MEMORY[0x24BDC1D70], CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"), *MEMORY[0x24BDC1D70], CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"), *MEMORY[0x24BDC1EA8], *MEMORY[0x24BDC1D78], a3);
}

+ (void)fetchiCloudDriveItemsUsingThresholds:(id)a3 shouldCheckTrash:(BOOL)a4 completion:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  BOOL v43;
  _QWORD v44[4];
  id v45;
  id v46;

  v7 = a5;
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BE179D8]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = &unk_24E435ED8;
  if (v8)
    v10 = (void *)v8;
  v11 = v10;

  v12 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(v11, "doubleValue");
  v14 = v13;

  objc_msgSend(MEMORY[0x24BDD1920], "bytes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v12, "initWithDoubleValue:unit:", v15, v14);

  v17 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDD1920], "megabytes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "measurementByConvertingToUnit:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  objc_msgSend(v17, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "queryForMinimumSizeInMegabytes:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init(MEMORY[0x24BDC24C0]);
  objc_msgSend(a1, "defaultFetchedAttributes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFetchAttributes:", v23);

  objc_msgSend(v22, "setLowPriority:", 0);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC24B8]), "initWithQueryString:context:", v21, v22);
  v25 = objc_alloc_init(MEMORY[0x24BEC7338]);
  v26 = (void *)objc_opt_new();
  v27 = MEMORY[0x24BDAC760];
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __98__ICQUICoreSpotlightQueryHelper_fetchiCloudDriveItemsUsingThresholds_shouldCheckTrash_completion___block_invoke;
  v44[3] = &unk_24E3F4320;
  v28 = v25;
  v45 = v28;
  v29 = v26;
  v46 = v29;
  objc_msgSend(v24, "setFoundItemsHandler:", v44);
  v36[0] = v27;
  v36[1] = 3221225472;
  v36[2] = __98__ICQUICoreSpotlightQueryHelper_fetchiCloudDriveItemsUsingThresholds_shouldCheckTrash_completion___block_invoke_2;
  v36[3] = &unk_24E3F4370;
  v37 = v24;
  v38 = v28;
  v41 = v7;
  v42 = a1;
  v39 = v29;
  v40 = v20;
  v43 = a4;
  v30 = v20;
  v31 = v29;
  v32 = v28;
  v33 = v24;
  v34 = v7;
  objc_msgSend(v33, "setCompletionHandler:", v36);
  objc_msgSend(v33, "start");

}

void __98__ICQUICoreSpotlightQueryHelper_fetchiCloudDriveItemsUsingThresholds_shouldCheckTrash_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Found %ld iCloud Drive items", buf, 0xCu);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __98__ICQUICoreSpotlightQueryHelper_fetchiCloudDriveItemsUsingThresholds_shouldCheckTrash_completion___block_invoke_18;
  v7[3] = &unk_24E3F34D8;
  v5 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = v3;
  v6 = v3;
  objc_msgSend(v5, "synchronized:", v7);

}

uint64_t __98__ICQUICoreSpotlightQueryHelper_fetchiCloudDriveItemsUsingThresholds_shouldCheckTrash_completion___block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
}

void __98__ICQUICoreSpotlightQueryHelper_fetchiCloudDriveItemsUsingThresholds_shouldCheckTrash_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v3 = a2;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __98__ICQUICoreSpotlightQueryHelper_fetchiCloudDriveItemsUsingThresholds_shouldCheckTrash_completion___block_invoke_2_cold_2(v3, v4);

  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "foundItemCount"))
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__2;
    v24 = __Block_byref_object_dispose__2;
    v25 = 0;
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __98__ICQUICoreSpotlightQueryHelper_fetchiCloudDriveItemsUsingThresholds_shouldCheckTrash_completion___block_invoke_23;
    v17 = &unk_24E3F4348;
    v19 = &v20;
    v5 = *(void **)(a1 + 40);
    v18 = *(id *)(a1 + 48);
    objc_msgSend(v5, "synchronized:", &v14);
    v6 = *(void **)(a1 + 72);
    v7 = v21[5];
    v8 = *(unsigned __int8 *)(a1 + 80);
    v9 = *(_QWORD *)(a1 + 56);
    v10 = (void *)objc_msgSend(*(id *)(a1 + 64), "copy", v14, v15, v16, v17);
    objc_msgSend(v6, "processFoundResults:minSizeInMegabytes:shouldCheckTrash:completion:", v7, v9, v8 != 0, v10);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    _ICQGetLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __98__ICQUICoreSpotlightQueryHelper_fetchiCloudDriveItemsUsingThresholds_shouldCheckTrash_completion___block_invoke_2_cold_1(v11);

    v12 = *(_QWORD *)(a1 + 64);
    ICQCreateErrorWithMessage();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v12 + 16))(v12, 0, 0, v13);

  }
}

void __98__ICQUICoreSpotlightQueryHelper_fetchiCloudDriveItemsUsingThresholds_shouldCheckTrash_completion___block_invoke_23(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (void)fetchTrashedItemsWithResults:(id)a3 minSizeInMegabytes:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v7 = a4;
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x24BDC82D8];
  v10 = a3;
  v11 = [v9 alloc];
  objc_msgSend(v10, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v11, "initWithSearchableItem:", v12);
  objc_msgSend(v13, "providerDomainID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_alloc(MEMORY[0x24BDC82E8]);
    objc_msgSend(v13, "providerDomainID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithProviderDomainID:itemIdentifier:", v16, *MEMORY[0x24BDC8230]);

    objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke;
    v20[3] = &unk_24E3F43E8;
    v22 = v8;
    v21 = v7;
    objc_msgSend(v18, "fetchURLForItemID:completionHandler:", v17, v20);

  }
  else
  {
    _ICQGetLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[ICQUICoreSpotlightQueryHelper fetchTrashedItemsWithResults:minSizeInMegabytes:completion:].cold.1(v19);

    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

void __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  id obj;
  _QWORD block[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  NSObject *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  _BYTE v41[128];
  _QWORD v42[4];

  v42[2] = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x24BDBCC60];
    v42[0] = *MEMORY[0x24BDBCCD0];
    v42[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    objc_msgSend(v6, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, v8, 1, &v40);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v40;

    if (v10)
    {
      _ICQGetLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke_cold_2(v10);

    }
    v24 = v5;
    v25 = v4;
    v12 = (void *)objc_opt_new();
    v13 = objc_alloc_init(MEMORY[0x24BEC7338]);
    v14 = dispatch_group_create();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v9;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v37 != v17)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          dispatch_group_enter(v14);
          objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = MEMORY[0x24BDAC760];
          v31[1] = 3221225472;
          v31[2] = __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke_28;
          v31[3] = &unk_24E3F4398;
          v32 = *(id *)(a1 + 32);
          v33 = v13;
          v34 = v12;
          v35 = v14;
          objc_msgSend(v20, "fetchItemForURL:completionHandler:", v19, v31);

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v16);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke_2;
    block[3] = &unk_24E3F43C0;
    v21 = *(id *)(a1 + 40);
    v29 = v12;
    v30 = v21;
    v22 = v12;
    dispatch_group_notify(v14, MEMORY[0x24BDAC9B8], block);

    v5 = v24;
    v4 = v25;
  }
  else
  {
    _ICQGetLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke_cold_1(v5);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke_28_cold_1(v6);

  }
  if (v5)
  {
    if ((objc_msgSend(v5, "isFolder") & 1) == 0)
    {
      objc_msgSend(v5, "documentSize");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      v10 = v9;
      objc_msgSend(*(id *)(a1 + 32), "doubleValue");
      v12 = v11;

      if (v10 > v12)
      {
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke_29;
        v14[3] = &unk_24E3F34D8;
        v13 = *(void **)(a1 + 40);
        v15 = *(id *)(a1 + 48);
        v16 = v5;
        objc_msgSend(v13, "synchronized:", v14);

      }
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke_29(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  objc_msgSend(v1, "itemIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v1, v3);

}

void __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

+ (void)processFoundResults:(id)a3 minSizeInMegabytes:(id)a4 shouldCheckTrash:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  _ICQGetLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v21 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEFAULT, "Found total of %ld iCloud Drive items", buf, 0xCu);
  }

  if (a5)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __100__ICQUICoreSpotlightQueryHelper_processFoundResults_minSizeInMegabytes_shouldCheckTrash_completion___block_invoke;
    v15[3] = &unk_24E3F4410;
    v19 = a1;
    v16 = v10;
    v18 = v12;
    v17 = v11;
    objc_msgSend(a1, "fetchTrashedItemsWithResults:minSizeInMegabytes:completion:", v16, v17, v15);

    v14 = v16;
  }
  else
  {
    objc_msgSend(a1, "filterItems:usingTrashedItems:", v10, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, void *, _QWORD))v12 + 2))(v12, v11, v14, 0);
  }

}

void __100__ICQUICoreSpotlightQueryHelper_processFoundResults_minSizeInMegabytes_shouldCheckTrash_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 56), "filterItems:usingTrashedItems:", *(_QWORD *)(a1 + 32), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (id)filterItems:(id)a3 usingTrashedItems:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[4];
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC82D8]), "initWithSearchableItem:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12));
        if (objc_msgSend(v13, "isShared"))
        {
          v14 = objc_msgSend(v13, "isSharedByCurrentUser");
          if (!v13)
            goto LABEL_17;
        }
        else
        {
          v14 = 1;
          if (!v13)
            goto LABEL_17;
        }
        if ((objc_msgSend(v13, "isFolder") & 1) == 0 && ((v14 ^ 1) & 1) == 0)
        {
          objc_msgSend(v13, "itemIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            _ICQGetLogSystem();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              +[ICQUICoreSpotlightQueryHelper filterItems:usingTrashedItems:].cold.1(v24, v13, &v25, v17);

          }
          else
          {
            objc_msgSend(v7, "addObject:", v13);
          }
        }
LABEL_17:

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v10);
  }

  v18 = (void *)objc_msgSend(v7, "copy");
  return v18;
}

+ (void)deleteiCloudDriveItems:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDC82F0];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC8390]), "initWithItems:", v4);

  objc_msgSend(v6, "scheduleAction:", v5);
}

+ (void)deleteiCloudDriveItem:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "deleteiCloudDriveItems:", v6, v7, v8);
}

+ (id)totalSizeStringForItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  void *v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v32;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "documentSize");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "doubleValue");
        v7 = v7 + v10;

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }
  v11 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(MEMORY[0x24BDD1920], "bytes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithDoubleValue:unit:", v12, v7);

  v14 = objc_alloc_init(MEMORY[0x24BDD1668]);
  objc_msgSend(v14, "setUnitStyle:", 1);
  v15 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v15, "setMaximumFractionDigits:", 0);
  v16 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDD1920], "megabytes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "measurementByConvertingToUnit:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  objc_msgSend(v16, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "doubleValue");
  if (v20 >= 1000.0)
  {
    v25 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDD1920], "gigabytes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "measurementByConvertingToUnit:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValue");
    objc_msgSend(v25, "numberWithDouble:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setMaximumFractionDigits:", 1);
    objc_msgSend(v15, "stringFromNumber:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1920], "gigabytes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringFromUnit:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v23, v29);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v15, "stringFromNumber:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1920], "megabytes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringFromUnit:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v21, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

void __98__ICQUICoreSpotlightQueryHelper_fetchiCloudDriveItemsUsingThresholds_shouldCheckTrash_completion___block_invoke_2_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "+[ICQUICoreSpotlightQueryHelper fetchiCloudDriveItemsUsingThresholds:shouldCheckTrash:completion:]_block_invoke";
  _os_log_debug_impl(&dword_21F2CC000, log, OS_LOG_TYPE_DEBUG, "%s completed with 0 item count. ", (uint8_t *)&v1, 0xCu);
}

void __98__ICQUICoreSpotlightQueryHelper_fetchiCloudDriveItemsUsingThresholds_shouldCheckTrash_completion___block_invoke_2_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136315394;
  v5 = "+[ICQUICoreSpotlightQueryHelper fetchiCloudDriveItemsUsingThresholds:shouldCheckTrash:completion:]_block_invoke_2";
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_DEBUG, "%s completed with error: %@", (uint8_t *)&v4, 0x16u);

  OUTLINED_FUNCTION_1_1();
}

+ (void)fetchTrashedItemsWithResults:(os_log_t)log minSizeInMegabytes:completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F2CC000, log, OS_LOG_TYPE_ERROR, "First item does not have a providerDomainID", v1, 2u);
}

void __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_21F2CC000, v2, v3, "There is no trash directory for this user. Error: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_21F2CC000, v2, v3, "Can't read the trash: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke_28_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_21F2CC000, v2, v3, "Can't read trash contents: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

+ (void)filterItems:(_QWORD *)a3 usingTrashedItems:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_21F2CC000, a4, OS_LOG_TYPE_DEBUG, "This item was already deleted. Skipping %@", a1, 0xCu);

}

@end
