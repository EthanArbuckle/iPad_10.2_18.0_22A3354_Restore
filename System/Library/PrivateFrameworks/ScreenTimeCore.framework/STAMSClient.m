@implementation STAMSClient

+ (id)makeAMSMediaTaskForApps:(id)a3 isGlobal:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[16];
  _QWORD v26[2];
  _QWORD v27[2];
  _BYTE v28[128];
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "adamID"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v6, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
      }
      while (v9);
    }

    objc_msgSend(MEMORY[0x1E0CFD9E8], "bagForProfile:profileVersion:", CFSTR("ScreenTime"), CFSTR("1"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x1E0CFDB48]);
    if (v4)
    {
      v15 = (void *)objc_msgSend(v14, "initWithType:clientIdentifier:clientVersion:bag:", 7, CFSTR("com.apple.ScreenTimeSettingsUI"), CFSTR("1"), v13);
      +[STAMSClient _makeGlobalQueryParamsFor:](STAMSClient, "_makeGlobalQueryParamsFor:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAdditionalQueryParams:", v16);

      +[STLog appInfo](STLog, "appInfo");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v18 = "AMSMediaTask created with type: AMSMediaTaskTypeAppDistribution";
LABEL_17:
        _os_log_impl(&dword_1D22E7000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
      }
    }
    else
    {
      v15 = (void *)objc_msgSend(v14, "initWithType:clientIdentifier:clientVersion:bag:", 0, CFSTR("com.apple.ScreenTimeSettingsUI"), CFSTR("1"), v13);
      v26[0] = CFSTR("extend");
      v26[1] = CFSTR("additionalPlatforms");
      v27[0] = CFSTR("shortName");
      v27[1] = CFSTR("iphone,ipad,mac,appletv,watch,web");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAdditionalQueryParams:", v19);

      +[STLog appInfo](STLog, "appInfo");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v18 = "AMSMediaTask created with type: AMSMediaTaskTypeApp";
        goto LABEL_17;
      }
    }

    objc_msgSend(v15, "setItemIdentifiers:", v6);
    goto LABEL_19;
  }
  +[STLog appInfo](STLog, "appInfo");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D22E7000, v6, OS_LOG_TYPE_DEFAULT, "AMSMediaTask requested for an empty array of STAppInfos. Returning nil", buf, 2u);
  }
  v15 = 0;
LABEL_19:

  return v15;
}

+ (void)loadMediaForTask:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "bag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "BOOLForKey:", CFSTR("enable-app-distribution-account-personalization"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__STAMSClient_loadMediaForTask_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E9371478;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v8, "valueWithCompletion:", v11);

}

void __54__STAMSClient_loadMediaForTask_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  if (objc_msgSend(a2, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ams_activeiTunesAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAccount:", v4);

    +[STLog appInfo](STLog, "appInfo");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D22E7000, v5, OS_LOG_TYPE_DEFAULT, "Adding account info to media task", buf, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "perform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__STAMSClient_loadMediaForTask_withCompletionHandler___block_invoke_24;
  v7[3] = &unk_1E9371450;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v6, "addFinishBlock:", v7);

}

uint64_t __54__STAMSClient_loadMediaForTask_withCompletionHandler___block_invoke_24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[STAMSClient _handleLoadMediaTaskForResult:error:withCompletionHandler:](STAMSClient, "_handleLoadMediaTaskForResult:error:withCompletionHandler:", a2, a3, *(_QWORD *)(a1 + 32));
}

+ (void)_handleLoadMediaTaskForResult:(id)a3 error:(id)a4 withCompletionHandler:(id)a5
{
  void (**v7)(id, id, _QWORD);
  void *v8;
  char v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  const __CFString *v34;
  STAppMetadata *v35;
  NSObject *v36;
  id v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  id obj;
  void (**v61)(id, id, _QWORD);
  id v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  char v81;
  char v82[15];
  char v83;
  char v84[15];
  char v85;
  char v86[15];
  char v87;
  char v88[15];
  char v89;
  char v90[15];
  char v91;
  char v92[15];
  char v93;
  char v94[15];
  uint8_t v95[128];
  uint8_t buf[4];
  id v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  v58 = a4;
  v7 = (void (**)(id, id, _QWORD))a5;
  if (os_variant_has_internal_content())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("STAppInfoCacheForcingAMSNilResponse"));

  }
  else
  {
    v9 = 0;
  }
  if (!v59 || (v9 & 1) != 0)
  {
    v57 = v58;
    v7[2](v7, v58, 0);
    goto LABEL_70;
  }
  v62 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  objc_msgSend(v59, "responseDataItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v95, 16);
  if (!v64)
    goto LABEL_68;
  v63 = *(_QWORD *)v78;
  v61 = v7;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v78 != v63)
        objc_enumerationMutation(obj);
      v11 = *(id *)(*((_QWORD *)&v77 + 1) + 8 * v10);
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("attributes"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("attributes"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("platformAttributes"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ios"));
        v15 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("attributes"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("platformAttributes"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("osx"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("attributes"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("platformAttributes"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("appletvos"));
        v20 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("attributes"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("platformAttributes"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("xros"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = v15;
        v66 = (void *)v20;
        if (v15 || (v24 = v75) != 0 || (v24 = (void *)v20) != 0)
        {
          v25 = v24;
LABEL_16:
          v65 = v23;
          v73 = v10;
          -[NSObject objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", CFSTR("bundleId"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", CFSTR("seller"));
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("name"));
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("contentRatingsBySystem"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("appsApple"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("name"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSObject objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", CFSTR("artwork"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB28]), "initWithDictionary:", v29);
          objc_msgSend(v30, "URLWithSize:", 72.0, 72.0);
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = (void *)v31;
          if (v26 && v31)
          {
            v33 = CFSTR("mac-software");
            if (!v75)
              v33 = &stru_1E9372498;
            if (v15)
              v34 = CFSTR("software");
            else
              v34 = v33;
            v35 = -[STAppMetadata initWithBundleIdentifier:displayName:artworkURL:vendorName:ratingLabel:software:]([STAppMetadata alloc], "initWithBundleIdentifier:displayName:artworkURL:vendorName:ratingLabel:software:", v26, v69, v31, v71, v67, v34);
            +[STLog appInfo](STLog, "appInfo");
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543362;
              v97 = v69;
              _os_log_impl(&dword_1D22E7000, v36, OS_LOG_TYPE_INFO, "STAppMetadata parsing success for app name: %{public}@", buf, 0xCu);
            }
          }
          else
          {
            +[STLog appInfo](STLog, "appInfo");
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              +[STAMSClient _handleLoadMediaTaskForResult:error:withCompletionHandler:].cold.7(&v81, v82);
            v35 = 0;
          }

          v7 = v61;
          v10 = v73;
          v23 = v65;
        }
        else
        {
          v25 = v23;
          if (v25)
            goto LABEL_16;
          +[STLog appInfo](STLog, "appInfo");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            +[STAMSClient _handleLoadMediaTaskForResult:error:withCompletionHandler:].cold.6(&v83, v84);
          v35 = 0;
        }

        goto LABEL_34;
      }
      +[STLog appInfo](STLog, "appInfo");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[STAMSClient _handleLoadMediaTaskForResult:error:withCompletionHandler:].cold.5(&v85, v86);
      v35 = 0;
LABEL_34:

      if (v35)
        goto LABEL_58;
      v37 = v11;
      objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("attributes"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v38)
      {
        v74 = v10;
        objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("bundleId"));
        v40 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("developerName"));
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("attributes"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("platformAttributes"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("ios"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("versionAttributes"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v44, "allKeys");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "objectAtIndexedSubscript:", 0);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (v46)
        {
          objc_msgSend(v44, "objectForKeyedSubscript:", v46);
          v47 = objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v47, "objectForKeyedSubscript:", CFSTR("shortName"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("contentRatingsBySystem"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("appsApple"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("name"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          if (v40)
          {
            -[NSObject objectForKeyedSubscript:](v47, "objectForKeyedSubscript:", CFSTR("artwork"));
            v51 = objc_claimAutoreleasedReturnValue();
            v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB28]), "initWithDictionary:", v51);
            objc_msgSend(v52, "URLWithSize:", 72.0, 72.0);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = v52;
            v70 = v51;
            if (v53)
            {
              v35 = -[STAppMetadata initWithBundleIdentifier:displayName:artworkURL:vendorName:ratingLabel:software:]([STAppMetadata alloc], "initWithBundleIdentifier:displayName:artworkURL:vendorName:ratingLabel:software:", v40, v72, v53, v76);
              +[STLog appInfo](STLog, "appInfo");
              v54 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                v97 = v72;
                _os_log_impl(&dword_1D22E7000, v54, OS_LOG_TYPE_INFO, "STAppMetadata (global) parsing success for app name: %{public}@", buf, 0xCu);
              }
            }
            else
            {
              +[STLog appInfo](STLog, "appInfo");
              v54 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                +[STAMSClient _handleLoadMediaTaskForResult:error:withCompletionHandler:].cold.4(&v87, v88);
              v35 = 0;
            }

            v7 = v61;
          }
          else
          {
            +[STLog appInfo](STLog, "appInfo");
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              +[STAMSClient _handleLoadMediaTaskForResult:error:withCompletionHandler:].cold.3(&v89, v90);
            v35 = 0;
          }

        }
        else
        {
          +[STLog appInfo](STLog, "appInfo");
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            +[STAMSClient _handleLoadMediaTaskForResult:error:withCompletionHandler:].cold.2(&v91, v92);
          v35 = 0;
        }

        v10 = v74;
      }
      else
      {
        +[STLog appInfo](STLog, "appInfo");
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          +[STAMSClient _handleLoadMediaTaskForResult:error:withCompletionHandler:].cold.1(&v93, v94);
        v35 = 0;
      }

      if (v35)
      {
LABEL_58:
        objc_msgSend(v62, "addObject:", v35);
      }
      else
      {
        +[STLog appInfo](STLog, "appInfo");
        v35 = (STAppMetadata *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v35->super, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v97 = v37;
          _os_log_error_impl(&dword_1D22E7000, &v35->super, OS_LOG_TYPE_ERROR, "Error parsing response item: %@", buf, 0xCu);
        }
      }

      ++v10;
    }
    while (v64 != v10);
    v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v95, 16);
    v64 = v55;
  }
  while (v55);
LABEL_68:

  v56 = (void *)objc_msgSend(v62, "copy");
  ((void (**)(id, id, void *))v7)[2](v7, 0, v56);

  v57 = v58;
LABEL_70:

}

+ (id)_makeGlobalQueryParamsFor:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setObject:forKey:", CFSTR("shortName,allowedDistributorIds"), CFSTR("extend"));
  objc_msgSend(v4, "setObject:forKey:", CFSTR("additionalVersions"), CFSTR("with"));
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v10, "versionIdentifier"))
        {
          v11 = (void *)MEMORY[0x1E0CB3940];
          v12 = objc_msgSend(v10, "versionIdentifier");
        }
        else
        {
          if (!objc_msgSend(v10, "betaVersionIdentifier"))
            continue;
          v11 = (void *)MEMORY[0x1E0CB3940];
          v12 = objc_msgSend(v10, "betaVersionIdentifier");
        }
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%llu"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("version[apps:%llu]"), objc_msgSend(v10, "adamID"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v13, v14);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v15 = (void *)objc_msgSend(v4, "copy");
  return v15;
}

+ (void)_handleLoadMediaTaskForResult:(_BYTE *)a1 error:(_BYTE *)a2 withCompletionHandler:.cold.1(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_5(a1, a2);
  OUTLINED_FUNCTION_0_5(&dword_1D22E7000, v2, v3, "STAppMetadata (global) parsing error - responseItem[attributes] is nil", v4);
}

+ (void)_handleLoadMediaTaskForResult:(_BYTE *)a1 error:(_BYTE *)a2 withCompletionHandler:.cold.2(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_5(a1, a2);
  OUTLINED_FUNCTION_0_5(&dword_1D22E7000, v2, v3, "STAppMetadata (global) parsing error - platformAttributes is nil", v4);
}

+ (void)_handleLoadMediaTaskForResult:(_BYTE *)a1 error:(_BYTE *)a2 withCompletionHandler:.cold.3(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_5(a1, a2);
  OUTLINED_FUNCTION_0_5(&dword_1D22E7000, v2, v3, "STAppMetadata (global) parsing error - bundleIdentifier is nil", v4);
}

+ (void)_handleLoadMediaTaskForResult:(_BYTE *)a1 error:(_BYTE *)a2 withCompletionHandler:.cold.4(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_5(a1, a2);
  OUTLINED_FUNCTION_0_5(&dword_1D22E7000, v2, v3, "STAppMetadata (global) parsing error - artworkURL is nil", v4);
}

+ (void)_handleLoadMediaTaskForResult:(_BYTE *)a1 error:(_BYTE *)a2 withCompletionHandler:.cold.5(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_5(a1, a2);
  OUTLINED_FUNCTION_0_5(&dword_1D22E7000, v2, v3, "STAppMetadata parsing error - responseItem[attributes] is nil", v4);
}

+ (void)_handleLoadMediaTaskForResult:(_BYTE *)a1 error:(_BYTE *)a2 withCompletionHandler:.cold.6(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_5(a1, a2);
  OUTLINED_FUNCTION_0_5(&dword_1D22E7000, v2, v3, "STAppMetadata parsing error - platformAttributes is nil", v4);
}

+ (void)_handleLoadMediaTaskForResult:(_BYTE *)a1 error:(_BYTE *)a2 withCompletionHandler:.cold.7(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_5(a1, a2);
  OUTLINED_FUNCTION_0_5(&dword_1D22E7000, v2, v3, "STAppMetadata parsing error - bundleIdentifier OR artworkURL are nil", v4);
}

@end
