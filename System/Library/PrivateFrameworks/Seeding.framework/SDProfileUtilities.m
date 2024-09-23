@implementation SDProfileUtilities

+ (void)removeSeedProfileIfRestricted
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  if (_os_feature_enabled_impl())
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.seeding"));
    if (objc_msgSend(v3, "BOOLForKey:", CFSTR("EnableProfiles")))
    {
      +[SDSeedingLogging profileHandle](SDSeedingLogging, "profileHandle");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1D4F89000, v4, OS_LOG_TYPE_DEFAULT, "Profiles are currently allowed, they will not be removed.", v5, 2u);
      }

    }
    else
    {
      objc_msgSend(a1, "removeSeedingProfile");
    }

  }
}

+ (void)installProfileWithData:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[SDSeedingLogging profileHandle](SDSeedingLogging, "profileHandle");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v30 = objc_msgSend(v5, "length");
    _os_log_impl(&dword_1D4F89000, v6, OS_LOG_TYPE_DEFAULT, "Will install profile with data.length [%lu]", buf, 0xCu);
  }

  v27 = *MEMORY[0x1E0D47278];
  v28 = &unk_1E98D6628;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(MEMORY[0x1E0D47220], "profileWithData:outError:", v5, &v26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v26;
  if (v9)
  {
    v10 = v9;
    if (a4)
      *a4 = objc_retainAutorelease(v9);
    +[SDSeedingLogging profileHandle](SDSeedingLogging, "profileHandle");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[SDProfileUtilities installProfileWithData:error:].cold.3(v10);
LABEL_8:

    goto LABEL_21;
  }
  objc_msgSend(v8, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = SDIsSeedProfileIdentifier(v12);

  if ((v13 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v15 = (id)objc_msgSend(v14, "installProfileData:options:outError:", v5, v7, &v25);
    v10 = v25;

    if (v10)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v10);
      +[SDSeedingLogging profileHandle](SDSeedingLogging, "profileHandle");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[SDProfileUtilities installProfileWithData:error:].cold.1(v10);
      goto LABEL_8;
    }
    +[SDSeedingLogging profileHandle](SDSeedingLogging, "profileHandle");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4F89000, v24, OS_LOG_TYPE_DEFAULT, "Beta profile installation complete.", buf, 2u);
    }

  }
  else
  {
    +[SDSeedingLogging profileHandle](SDSeedingLogging, "profileHandle");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[SDProfileUtilities installProfileWithData:error:].cold.2(v16, v17, v18, v19, v20, v21, v22, v23);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.seeding.profile-utils"), 1, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_21:

}

+ (BOOL)removeSeedingProfile
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  BOOL v16;
  _QWORD v18[4];
  NSObject *v19;
  NSObject *v20;
  uint8_t *v21;
  _QWORD v22[4];
  id v23;
  NSObject *v24;
  uint8_t *v25;
  uint8_t v26[16];
  uint8_t buf[8];
  uint8_t *v28;
  uint64_t v29;
  char v30;

  +[SDSeedingLogging profileHandle](SDSeedingLogging, "profileHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4F89000, v3, OS_LOG_TYPE_DEFAULT, "Removing seeding profile", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v28 = buf;
  v29 = 0x2020000000;
  v30 = 0;
  objc_msgSend(a1, "getInstalledSeedProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __42__SDProfileUtilities_removeSeedingProfile__block_invoke;
    v22[3] = &unk_1E98CF520;
    v25 = buf;
    v9 = v4;
    v23 = v9;
    v10 = v5;
    v24 = v10;
    objc_msgSend(v6, "removeProfileAsyncWithIdentifier:installationType:completion:", v7, 1, v22);

    dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend(a1, "getInstalledSeedProfile");
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      +[SDSeedingLogging profileHandle](SDSeedingLogging, "profileHandle");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_1D4F89000, v12, OS_LOG_TYPE_DEFAULT, "Deleted one profile, but detected another, deleting again.", v26, 2u);
      }

      v13 = dispatch_group_create();
      dispatch_group_enter(v13);
      objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject identifier](v11, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v8;
      v18[1] = 3221225472;
      v18[2] = __42__SDProfileUtilities_removeSeedingProfile__block_invoke_10;
      v18[3] = &unk_1E98CF520;
      v21 = buf;
      v19 = v11;
      v10 = v13;
      v20 = v10;
      objc_msgSend(v14, "removeProfileAsyncWithIdentifier:installationType:completion:", v15, 1, v18);

      dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    }
    v16 = v28[24] != 0;

  }
  else
  {
    +[SDSeedingLogging profileHandle](SDSeedingLogging, "profileHandle");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_1D4F89000, v11, OS_LOG_TYPE_DEFAULT, "No seed profile exists.", v26, 2u);
    }
    v16 = 0;
  }

  _Block_object_dispose(buf, 8);
  return v16;
}

void __42__SDProfileUtilities_removeSeedingProfile__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    +[SDSeedingLogging profileHandle](SDSeedingLogging, "profileHandle");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __42__SDProfileUtilities_removeSeedingProfile__block_invoke_cold_1(v3);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    +[SDSeedingLogging profileHandle](SDSeedingLogging, "profileHandle");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1D4F89000, v4, OS_LOG_TYPE_DEFAULT, "Deleted profile %@", (uint8_t *)&v6, 0xCu);

    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __42__SDProfileUtilities_removeSeedingProfile__block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    +[SDSeedingLogging profileHandle](SDSeedingLogging, "profileHandle");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __42__SDProfileUtilities_removeSeedingProfile__block_invoke_10_cold_1(v3);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    +[SDSeedingLogging profileHandle](SDSeedingLogging, "profileHandle");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1D4F89000, v4, OS_LOG_TYPE_DEFAULT, "Deleted second profile %@", (uint8_t *)&v6, 0xCu);

    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

+ (BOOL)isProfileInstallationAllowed
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isProfileUIInstallationAllowed");

  return v3;
}

+ (id)getAssetAudienceIDForInstalledProfile:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "getInstalledSeedProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    +[SDSeedingLogging profileHandle](SDSeedingLogging, "profileHandle");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4F89000, v18, OS_LOG_TYPE_INFO, "No beta profile found", buf, 2u);
    }

    goto LABEL_25;
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v4, "payloads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (!v7)
  {

    goto LABEL_21;
  }
  v8 = v7;
  v28 = a3;
  v29 = v5;
  v9 = 0;
  v10 = *(_QWORD *)v31;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v31 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v12;
        objc_msgSend(v13, "defaultsForDomain:", CFSTR("com.apple.MobileAsset"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("MobileAssetAssetAudience"));
          v16 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v16;
        }

      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  }
  while (v8);

  a3 = v28;
  if (!v9)
  {
LABEL_21:
    +[SDSeedingLogging profileHandle](SDSeedingLogging, "profileHandle", v28, v29);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[SDProfileUtilities getAssetAudienceIDForInstalledProfile:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);

    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.seeding.profile-utils"), 0, 0);
      v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
LABEL_25:
    v9 = 0;
    goto LABEL_26;
  }
  +[SDSeedingLogging profileHandle](SDSeedingLogging, "profileHandle");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v35 = v9;
    _os_log_impl(&dword_1D4F89000, v17, OS_LOG_TYPE_INFO, "Found beta profile with Asset Audience ID [%{public}@]", buf, 0xCu);
  }

LABEL_26:
  return v9;
}

+ (void)forceRemoveSeedingProfile
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  +[SDSeedingLogging profileHandle](SDSeedingLogging, "profileHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D4F89000, v2, OS_LOG_TYPE_INFO, "Removing seeding profile", v5, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeProfileWithIdentifier:", CFSTR("com.apple.applebetasoftware"));

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeProfileWithIdentifier:", CFSTR("com.apple.appleseedsoftware"));

}

+ (id)getInstalledSeedProfile
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installedProfileWithIdentifier:", CFSTR("com.apple.appleseedsoftware"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "installedProfileWithIdentifier:", CFSTR("com.apple.applebetasoftware"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (void)installProfileWithData:(void *)a1 error:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "MCVerboseDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_1D4F89000, v2, v3, "Installation failed. Error: [%{public}@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)installProfileWithData:(uint64_t)a3 error:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D4F89000, a1, a3, "Profile is not an Apple Beta Software profile, cancelling installation.", a5, a6, a7, a8, 0);
}

+ (void)installProfileWithData:(void *)a1 error:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "MCVerboseDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_1D4F89000, v2, v3, "Can't parse profile. Error: [%{public}@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __42__SDProfileUtilities_removeSeedingProfile__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "MCVerboseDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_1D4F89000, v2, v3, "Removal of beta profile failed. Error: [%{public}@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __42__SDProfileUtilities_removeSeedingProfile__block_invoke_10_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "MCVerboseDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_1D4F89000, v2, v3, "Removal of second beta profile failed. Error: [%{public}@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)getAssetAudienceIDForInstalledProfile:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D4F89000, a1, a3, "Found beta profile but could not parse Asset Audience ID", a5, a6, a7, a8, 0);
}

@end
