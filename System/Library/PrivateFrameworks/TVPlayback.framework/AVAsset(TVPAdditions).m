@implementation AVAsset(TVPAdditions)

+ (uint64_t)tvp_shouldIgnoreLoadFailureForKey:()TVPAdditions error:logObject:
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("availableVideoDynamicRanges")) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("maximumVideoResolution")) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("availableChapterLocales")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayForKey:", CFSTR("AVAssetKeysForWhichToIgnoreFailures"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && v13)
    {
      if (objc_msgSend(v13, "containsObject:", v7))
      {
        if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 138412290;
          v19 = v7;
          _os_log_impl(&dword_228A4E000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring failure of key %@ due to user defaults", (uint8_t *)&v18, 0xCu);
        }
LABEL_20:
        v10 = 1;
LABEL_23:

        goto LABEL_5;
      }
    }
    else if (!v7)
    {
      goto LABEL_22;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("availableMediaCharacteristicsWithMediaSelectionOptions")))
    {
      objc_msgSend(v8, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BDB1BD8]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v15, "count")
        || objc_msgSend(v15, "count") == 1
        && (objc_msgSend(v15, "firstObject"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDDCF90]),
            v16,
            v17))
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 138412546;
          v19 = v7;
          v20 = 2112;
          v21 = v8;
          _os_log_impl(&dword_228A4E000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring failure of key %@ due to non-fatal failure to load localized media selection names: %@", (uint8_t *)&v18, 0x16u);
        }

        goto LABEL_20;
      }

    }
LABEL_22:
    v10 = 0;
    goto LABEL_23;
  }
  v10 = 1;
LABEL_5:

  return v10;
}

- (uint64_t)tvp_maximumVideoResolution
{
  uint64_t v2;
  uint64_t result;
  double v4;
  uint64_t v5;

  v2 = objc_msgSend(a1, "statusOfValueForKey:error:", CFSTR("maximumVideoResolution"), 0);
  result = 0;
  if (v2 == 2)
  {
    objc_msgSend(a1, "maximumVideoResolution");
    v5 = 3;
    if (v4 < 3456.0)
      v5 = 2;
    if (v4 < 1280.0)
      v5 = 1;
    if (v4 > 0.0)
      return v5;
    else
      return 0;
  }
  return result;
}

- (int64_t)tvp_maximumVideoRange
{
  int64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  int v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = 0;
  if (objc_msgSend(a1, "statusOfValueForKey:error:", CFSTR("availableVideoDynamicRanges"), 0) == 2)
  {
    objc_msgSend(a1, "availableVideoDynamicRanges");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      LODWORD(v6) = 0;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v3);
          v9 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "intValue");
          if (v9 <= (int)v6)
            v6 = v6;
          else
            v6 = v9;
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }
    v2 = +[TVPPlayer tvpVideoRangeForVideoDynamicRange:](TVPPlayer, "tvpVideoRangeForVideoDynamicRange:", v6);

  }
  return v2;
}

@end
