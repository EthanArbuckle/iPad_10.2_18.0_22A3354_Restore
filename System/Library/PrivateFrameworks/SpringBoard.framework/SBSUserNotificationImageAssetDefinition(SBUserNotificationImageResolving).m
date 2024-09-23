@implementation SBSUserNotificationImageAssetDefinition(SBUserNotificationImageResolving)

- (id)sb_resolvedImage
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;

  objc_msgSend(a1, "imagePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "catalogPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "catalogImageKey");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v2)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithContentsOfFile:", v2);
    goto LABEL_15;
  }
  v6 = 0;
  if (v3 && v4)
  {
    v7 = objc_alloc(MEMORY[0x1E0CEAC60]);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v10 = (void *)objc_msgSend(v7, "initWithURL:idiom:error:", v8, objc_msgSend(v9, "userInterfaceIdiom"), &v14);
    v11 = v14;

    if (v10)
    {
      objc_msgSend(v10, "imageNamed:withTrait:", v5, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_sbSetAssociatedAssetManager:", v10);
      if (v6)
      {
LABEL_14:

        goto LABEL_15;
      }
      SBLogAlertItems();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SBSUserNotificationImageAssetDefinition(SBUserNotificationImageResolving) sb_resolvedImage].cold.2();
    }
    else
    {
      if (!v11)
      {
LABEL_13:
        v6 = 0;
        goto LABEL_14;
      }
      SBLogAlertItems();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SBSUserNotificationImageAssetDefinition(SBUserNotificationImageResolving) sb_resolvedImage].cold.1();
    }

    goto LABEL_13;
  }
LABEL_15:

  return v6;
}

- (uint64_t)sb_resolvedTintColor
{
  return 0;
}

- (void)sb_resolvedImage
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, v0, (uint64_t)v0, "Unable to load asset from asset bundle for path: %{public}@ because asset was not found: %{public}@.", v1);
  OUTLINED_FUNCTION_2_0();
}

@end
