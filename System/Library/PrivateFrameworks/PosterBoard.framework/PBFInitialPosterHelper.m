@implementation PBFInitialPosterHelper

+ (id)initialPosterConfigurationWithModelCoordinatorProvider:(id)a3 role:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void (**v9)(void *, void *, id, id *);
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  NSObject *v31;
  _BOOL4 v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void (**v69)(void *, void *, id, id *);
  id v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  _QWORD aBlock[4];
  id v77;
  id v78;
  const __CFString *v79;
  id v80;
  uint8_t buf[4];
  id v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__PBFInitialPosterHelper_initialPosterConfigurationWithModelCoordinatorProvider_role___block_invoke;
  aBlock[3] = &unk_1E86F6F68;
  v7 = v5;
  v77 = v7;
  v8 = v6;
  v78 = v8;
  v9 = (void (**)(void *, void *, id, id *))_Block_copy(aBlock);
  PBFLogPosterContents();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB9FA000, v10, OS_LOG_TYPE_DEFAULT, "(PBFInitialPosterHelper) Setting up default wallpaper", buf, 2u);
  }

  v11 = *MEMORY[0x1E0D7FC58];
  if (objc_msgSend(v8, "isEqual:", *MEMORY[0x1E0D7FC58]))
  {
    +[PBFWallpaperKitBridge defaultBridge](PBFWallpaperKitBridge, "defaultBridge");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "shouldInstallHeroPosterAsDefaultLockScreenWallpaper");

    if (v13)
    {
      v75 = 0;
      defaultLockScreenWallpaperExtensionIdentifier(&v75);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v75;
      PBFLogPosterContents();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v82 = v14;
        _os_log_impl(&dword_1CB9FA000, v16, OS_LOG_TYPE_DEFAULT, "(PBFInitialPosterHelper) No wallpaper set before, and a valid wallpaper identifier is set: %{public}@", buf, 0xCu);
      }

      v74 = 0;
      v9[2](v9, v14, v15, &v74);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v74;
      PBFLogPosterContents();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v18)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          +[PBFInitialPosterHelper initialPosterConfigurationWithModelCoordinatorProvider:role:].cold.2((uint64_t)v18, v20, v21, v22, v23, v24, v25, v26);

        v27 = (void *)MEMORY[0x1E0C9AA70];
      }
      else
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v82 = v15;
          _os_log_impl(&dword_1CB9FA000, v20, OS_LOG_TYPE_DEFAULT, "(PBFInitialPosterHelper) Hero Poster default wallpaper was setup: %{public}@", buf, 0xCu);
        }

        v79 = CFSTR("wallpaperRepresentingIdentifier");
        v80 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v29 = (void *)v17;
      if (v17)
        goto LABEL_35;
    }
    else
    {
      v27 = (void *)MEMORY[0x1E0C9AA70];
    }
    PBFLogPosterContents();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB9FA000, v37, OS_LOG_TYPE_DEFAULT, "(PBFInitialPosterHelper) No configuration path yet... let's setup a legacy poster.", buf, 2u);
    }

    v73 = 0;
    v9[2](v9, CFSTR("com.apple.PaperBoard.LegacyPoster"), CFSTR("LegacyPoster"), &v73);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v73;
    PBFLogPosterContents();
    v38 = objc_claimAutoreleasedReturnValue();
    v31 = v38;
    if (v30)
    {
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        +[PBFInitialPosterHelper initialPosterConfigurationWithModelCoordinatorProvider:role:].cold.1((uint64_t)v30, v31, v39, v40, v41, v42, v43, v44);
    }
    else if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB9FA000, v31, OS_LOG_TYPE_DEFAULT, "(PBFInitialPosterHelper) Generated legacy poster successfully.", buf, 2u);
    }
LABEL_34:

    if (!v29)
    {
      v36 = 0;
      goto LABEL_44;
    }
LABEL_35:
    v71 = v27;
    objc_msgSend(MEMORY[0x1E0D7FA78], "mutableConfigurationWithRole:", v8);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "copyContentsOfPath:error:", v29, 0);
    objc_msgSend(MEMORY[0x1E0D7FAE0], "defaultConfiguredPropertiesForRole:", v8);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v46, "mutableCopy");

    if (objc_msgSend(v8, "isEqual:", v11))
    {
      v68 = v29;
      v69 = v9;
      v70 = v7;
      objc_msgSend(MEMORY[0x1E0D7FB80], "defaultConfiguration");
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = objc_alloc(MEMORY[0x1E0D7FB88]);
      objc_msgSend(MEMORY[0x1E0D7FB88], "defaultTitleColor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D7FB88], "defaultContentsLuminance");
      LOBYTE(v65) = 1;
      v67 = (void *)v48;
      v51 = objc_msgSend(v49, "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v48, 0, 0, v50, 0, 0, v65, 0);

      v66 = (void *)v51;
      objc_msgSend(v47, "setTitleStyleConfiguration:", v51);
      +[PBFWallpaperKitBridge defaultBridge](PBFWallpaperKitBridge, "defaultBridge");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "shouldDefaultWallpaperDisableModifyingLegibilityBlur") ^ 1;

      v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FB30]), "initWithLegibilityBlurEnabled:allowsModifyingLegibilityBlur:", 0, v53);
      v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FB18]), "initWithLegibilityBlurEnabled:allowsModifyingLegibilityBlur:", 0, v53);
      v56 = objc_alloc_init(MEMORY[0x1E0D7FB70]);
      v57 = objc_alloc_init(MEMORY[0x1E0D7FB10]);
      v58 = objc_alloc_init(MEMORY[0x1E0D7FB28]);
      v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FB20]), "initWithSelectedAppearanceType:lockPosterAppearance:solidColorAppearance:gradientAppearance:homePosterAppearance:customizationConfiguration:", 0, v54, v56, v57, v55, v58);
      objc_msgSend(v47, "setHomeScreenConfiguration:", v59);
      if (objc_msgSend(v71, "count"))
        objc_msgSend(v45, "storeUserInfo:error:", v71, 0);

      v9 = v69;
      v7 = v70;
      v60 = v67;
      v29 = v68;
    }
    else
    {
      if (!objc_msgSend(v8, "isEqual:", *MEMORY[0x1E0D7FC00]))
      {
LABEL_42:
        v61 = objc_alloc(MEMORY[0x1E0D7FA60]);
        objc_msgSend(v45, "_path");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "serverIdentity");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)objc_msgSend(v61, "initWithNewPath:destinationPosterUUID:sourceIdentity:configuredProperties:attributes:", v62, 0, v63, v47, 0);

        objc_msgSend(v36, "trackTemporaryState:", v45);
        v27 = v71;
        goto LABEL_44;
      }
      v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAA8]), "initWithSupportedDataLayout:creationBehavior:editingBehavior:deletionBehavior:", 2, 0, 1, 2);
      objc_msgSend(v47, "setAmbientConfiguration:", v60);
    }

    goto LABEL_42;
  }
  if (objc_msgSend(v8, "isEqual:", *MEMORY[0x1E0D7FC00]))
  {
    PBFLogPosterContents();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB9FA000, v28, OS_LOG_TYPE_DEFAULT, "(PBFInitialPosterHelper) No configuration path yet... let's setup a infograph.", buf, 2u);
    }

    v72 = 0;
    v9[2](v9, CFSTR("com.apple.ambient.AmbientUI.InfographPoster"), CFSTR("InfographPoster"), &v72);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v72;
    PBFLogPosterContents();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    if (v30)
    {
      if (v32)
      {
        *(_DWORD *)buf = 138412290;
        v82 = v30;
        v33 = "(PBFInitialPosterHelper) Error setting up infograph extension: %@";
        v34 = v31;
        v35 = 12;
LABEL_32:
        _os_log_impl(&dword_1CB9FA000, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
      }
    }
    else if (v32)
    {
      *(_WORD *)buf = 0;
      v33 = "(PBFInitialPosterHelper) Generated infograph poster successfully.";
      v34 = v31;
      v35 = 2;
      goto LABEL_32;
    }
    v27 = (void *)MEMORY[0x1E0C9AA70];
    goto LABEL_34;
  }
  v36 = 0;
  v27 = (void *)MEMORY[0x1E0C9AA70];
LABEL_44:

  return v36;
}

id __86__PBFInitialPosterHelper_initialPosterConfigurationWithModelCoordinatorProvider_role___block_invoke(uint64_t a1, uint64_t a2, void *a3, _QWORD *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v18;
  id v19;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "pbf_posterExtensionStoreCoordinatorForProviderIdentifier:error:", a2, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "staticDescriptorStoreCoordinatorForIdentifier:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "hasKnownVersions"))
    {
      objc_msgSend(v10, "pathOfLatestVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v9, "dynamicDescriptorStoreCoordinatorForIdentifier:", v7);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        v14 = 0;
      }
      else
      {
        v15 = *(_QWORD *)(a1 + 40);
        v19 = 0;
        objc_msgSend(v9, "createDynamicDescriptorStoreCoordinatorForIdentifier:role:error:", v7, v15, &v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v19;
        if (!v14)
        {
          v18 = 0;
          v16 = (id)objc_msgSend(v13, "addNewVersionWithContents:error:", 0, &v18);
          v14 = v18;
        }
        if (a4 && v14)
        {
          v14 = objc_retainAutorelease(v14);
          *a4 = v14;
        }
      }
      objc_msgSend(v13, "pathOfLatestVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)initialPosterProviderForRole:(id)a3 descriptorIdentifier:(id *)a4
{
  id v5;
  __CFString *v6;
  void *v7;
  int v8;

  v5 = a3;
  if (objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0D7FC00]))
  {
    if (a4)
      *a4 = CFSTR("InfographPoster");
    v6 = CFSTR("com.apple.ambient.AmbientUI.InfographPoster");
  }
  else if (objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0D7FC58]))
  {
    +[PBFWallpaperKitBridge defaultBridge](PBFWallpaperKitBridge, "defaultBridge");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldInstallHeroPosterAsDefaultLockScreenWallpaper");

    if (v8)
    {
      defaultLockScreenWallpaperExtensionIdentifier(a4);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a4)
        *a4 = CFSTR("LegacyPoster");
      v6 = CFSTR("com.apple.PaperBoard.LegacyPoster");
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)initialPosterConfigurationWithModelCoordinatorProvider:(uint64_t)a3 role:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, a2, a3, "(PBFInitialPosterHelper) Error setting up legacy extension: %@", a5, a6, a7, a8, 2u);
}

+ (void)initialPosterConfigurationWithModelCoordinatorProvider:(uint64_t)a3 role:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1CB9FA000, a2, a3, "(PBFInitialPosterHelper) Error setting up collection extension: %@", a5, a6, a7, a8, 2u);
}

@end
