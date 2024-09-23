@implementation STUsageDetailItem(UIAdditions)

- (id)localizedDisplayName
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];

  objc_msgSend(a1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE847F8]))
  {
    +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("AllAppsAndCategories");
LABEL_9:
    objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24CED4A80, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE84800]))
  {
    +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("AllApps");
    goto LABEL_9;
  }
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE84808]))
  {
    +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("AllCategories");
    goto LABEL_9;
  }
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE84810]))
  {
    +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("MostUsedWebsites");
    goto LABEL_9;
  }
  v8 = objc_msgSend(a1, "type");
  switch(v8)
  {
    case 3:
      objc_msgSend(MEMORY[0x24BE15828], "shortLocalizedNameForIdentifier:", v2);
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_19:
      v6 = (void *)v11;
      break;
    case 2:
      objc_msgSend(v2, "_lp_userVisibleHost");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 1:
      objc_msgSend(MEMORY[0x24BE844B8], "sharedCache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appInfoForBundleIdentifier:", v2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "displayName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "source"))
      {
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __54__STUsageDetailItem_UIAdditions__localizedDisplayName__block_invoke;
        v12[3] = &unk_24CED4940;
        v12[4] = a1;
        objc_msgSend(v9, "fetchAppInfoForBundleIdentifier:completionHandler:", v2, v12);
      }

      break;
    default:
      v6 = 0;
      break;
  }
LABEL_10:

  return v6;
}

- (id)iconImage
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;

  +[STIconCache sharedCache](STIconCache, "sharedCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "type");
  switch(v4)
  {
    case 3:
      objc_msgSend(v2, "imageForCategoryIdentifier:", v3);
      v5 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(a1, "localizedDisplayName");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "length"))
      {
        v10 = (void *)objc_opt_new();
        objc_msgSend(v10, "setScheme:", CFSTR("https"));
        objc_msgSend(v10, "setHost:", v9);
        objc_msgSend(v10, "URL");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "_lp_highLevelDomain");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "host");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "URL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v11;
        v15 = v12;
        v16 = v13;
        if (objc_msgSend(v14, "length"))
        {
          objc_msgSend(v14, "substringToIndex:", 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "uppercaseString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v15, "substringToIndex:", 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "uppercaseString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[STUsageDetailItem(UIAdditions) iconImage].cold.2();
        }

      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[STUsageDetailItem(UIAdditions) iconImage].cold.1((uint64_t)v9, v19, v20, v21, v22, v23, v24, v25);
        v18 = 0;
      }

      objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "monogramImageForInitial:useDarkColors:", v18, objc_msgSend(v27, "userInterfaceStyle") == 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        goto LABEL_7;
      goto LABEL_8;
    case 1:
      objc_msgSend(v2, "imageForBundleIdentifier:", v3);
      v5 = objc_claimAutoreleasedReturnValue();
      break;
    default:
LABEL_7:
      objc_msgSend(v2, "imageForBlankApplicationIcon");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObserver:selector:bundleIdentifier:", a1, sel__didFindIconImage_, v3);
      objc_msgSend(MEMORY[0x24BE844B8], "sharedCache");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:bundleIdentifier:", a1, sel__didFindIconImage_, v3);

      goto LABEL_8;
  }
  v6 = (void *)v5;
  if (!v5)
    goto LABEL_7;
LABEL_8:

  return v6;
}

- (uint64_t)lightColorsMonogram
{
  return objc_msgSend(a1, "_monogramUsingDarkColors:", 0);
}

- (uint64_t)darkColorsMonogram
{
  return objc_msgSend(a1, "_monogramUsingDarkColors:", 1);
}

- (id)_monogramUsingDarkColors:()UIAdditions
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;

  +[STIconCache sharedCache](STIconCache, "sharedCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedDisplayName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setScheme:", CFSTR("https"));
    objc_msgSend(v7, "setHost:", v6);
    objc_msgSend(v7, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_lp_highLevelDomain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "host");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v9;
    v13 = v10;
    v14 = v11;
    if (objc_msgSend(v12, "length"))
    {
      objc_msgSend(v12, "substringToIndex:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "uppercaseString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v13, "substringToIndex:", 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "uppercaseString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[STUsageDetailItem(UIAdditions) iconImage].cold.2();
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[STUsageDetailItem(UIAdditions) iconImage].cold.1((uint64_t)v6, v17, v18, v19, v20, v21, v22, v23);
    v16 = 0;
  }

  objc_msgSend(v5, "monogramImageForInitial:useDarkColors:", v16, a3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (uint64_t)_didFindIconImage:()UIAdditions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "willChangeValueForKey:", CFSTR("iconImage"));
  +[STIconCache sharedCache](STIconCache, "sharedCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:bundleIdentifier:", a1, v3);

  objc_msgSend(MEMORY[0x24BE844B8], "sharedCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:bundleIdentifier:", a1, v5);

  return objc_msgSend(a1, "didChangeValueForKey:", CFSTR("iconImage"));
}

+ (void)iconImageForBundleIdentifier:()UIAdditions completionHandler:
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[STIconCache sharedCache](STIconCache, "sharedCache");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageForBundleIdentifier:completionHandler:", v6, v5);

}

- (void)iconImage
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_0(&dword_212E1A000, MEMORY[0x24BDACB70], v0, "Failed to extract high level domain for URL: %@. Creating initial for host instead: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

@end
