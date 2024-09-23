@implementation UICloudSharingActivity

void __71___UICloudSharingActivity__isURLEligibleForSharing_isInitial_isFolder___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  char v20;
  _BYTE *v21;
  _BYTE *v22;
  _BYTE *v23;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.CloudDocs.SharingV1"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.CloudDocs.private.SharingOperation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_13;
  }
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  v6 = (void *)a1[4];
  v8 = *MEMORY[0x1E0C99AD0];
  v24[0] = *MEMORY[0x1E0C99B30];
  v7 = v24[0];
  v24[1] = v8;
  v10 = *MEMORY[0x1E0C99A00];
  v25 = *MEMORY[0x1E0C999D0];
  v9 = v25;
  v26 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "promisedItemResourceValuesForKeys:error:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKeyedSubscript:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v12, "objectForKeyedSubscript:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  v16 = (void *)a1[5];
  objc_msgSend(v12, "objectForKeyedSubscript:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "eligibleTypeForActivity:", v17);

  objc_msgSend(v12, "objectForKeyedSubscript:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  if ((_DWORD)v11)
  {
    v21 = (_BYTE *)a1[7];
    if (v21)
      *v21 = 0;
  }
  else if (v18)
  {
    v22 = (_BYTE *)a1[7];
    if (v22)
      *v22 = 1;
  }
  v23 = (_BYTE *)a1[8];
  if (v23)
    *v23 = v15 & ~v20;

LABEL_13:
}

void __64___UICloudSharingActivity__prepareWithActivityItems_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id location;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v16;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "isFileURL"))
        {
          v8 = v7;
          if (objc_msgSend(*(id *)(a1 + 32), "_isURLEligibleForSharing:isInitial:isFolder:", v8, 0, 0))
          {
            if (objc_msgSend(*(id *)(a1 + 32), "activityItemIsInSharedFolder"))
            {
              location = 0;
              objc_initWeak(&location, *(id *)(a1 + 32));
              v9 = (void *)MEMORY[0x1E0D97420];
              v10[0] = MEMORY[0x1E0C809B0];
              v10[1] = 3221225472;
              v10[2] = __64___UICloudSharingActivity__prepareWithActivityItems_completion___block_invoke_2;
              v10[3] = &unk_1E4001FB0;
              v10[4] = *(_QWORD *)(a1 + 32);
              v11 = v8;
              objc_copyWeak(&v13, &location);
              v12 = *(id *)(a1 + 40);
              objc_msgSend(v9, "findOriginatingSharedItemForSubitemURL:completionHandler:", v11, v10);

              objc_destroyWeak(&v13);
              objc_destroyWeak(&location);
            }
            else
            {
              objc_msgSend(*(id *)(a1 + 32), "_showSharingControllerForURL:completion:", v8, *(_QWORD *)(a1 + 40));
            }

            goto LABEL_17;
          }

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v4)
        continue;
      break;
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_17:

}

void __64___UICloudSharingActivity__prepareWithActivityItems_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __64___UICloudSharingActivity__prepareWithActivityItems_completion___block_invoke_2_cold_1((uint64_t)a1, (uint64_t)v6, v7);

    v5 = a1[5];
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64___UICloudSharingActivity__prepareWithActivityItems_completion___block_invoke_30;
  block[3] = &unk_1E4001F88;
  objc_copyWeak(&v12, a1 + 7);
  v10 = v5;
  v11 = a1[6];
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __64___UICloudSharingActivity__prepareWithActivityItems_completion___block_invoke_30(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_showSharingControllerForURL:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __64___UICloudSharingActivity__prepareWithActivityItems_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138412802;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_19E419000, log, OS_LOG_TYPE_ERROR, "%@: could not find the originating shared item URL, falling back to item URL:%@ : %@", (uint8_t *)&v5, 0x20u);
}

@end
