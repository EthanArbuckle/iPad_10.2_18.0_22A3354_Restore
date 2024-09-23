@implementation AVAsset(TVPAudioSubtitleAdditions)

- (id)tvp_sortedAudioAVMediaSelectionOptions
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;

  v8 = 0;
  v2 = objc_msgSend(a1, "statusOfValueForKey:error:", CFSTR("availableMediaCharacteristicsWithMediaSelectionOptions"), &v8);
  v3 = v8;
  if (v2 == 2
    || (v4 = 0, v2 == 3)
    && (v4 = 0,
        objc_msgSend(MEMORY[0x24BDB2378], "tvp_shouldIgnoreLoadFailureForKey:error:logObject:", CFSTR("availableMediaCharacteristicsWithMediaSelectionOptions"), v3, 0)))
  {
    objc_msgSend(a1, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x24BDB1C90]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "options");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "tvp_groupedAudioAVMediaSelectionOptionsFromOptions:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)tvp_sortedSubtitleAVMediaSelectionOptions
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v28;
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v45 = 0;
  v3 = objc_msgSend(a1, "statusOfValueForKey:error:", CFSTR("availableMediaCharacteristicsWithMediaSelectionOptions"), &v45);
  v4 = v45;
  if (v3 == 2
    || v3 == 3
    && objc_msgSend(MEMORY[0x24BDB2378], "tvp_shouldIgnoreLoadFailureForKey:error:logObject:", CFSTR("availableMediaCharacteristicsWithMediaSelectionOptions"), v4, 0))
  {
    v29 = v4;
    v30 = v2;
    objc_msgSend(a1, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x24BDB1CD8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "options");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v42;
      v14 = *MEMORY[0x24BDB1CA0];
      v15 = *MEMORY[0x24BDB1CC0];
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v42 != v13)
            objc_enumerationMutation(v10);
          v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          if (!objc_msgSend(v17, "hasMediaCharacteristic:", v14)
            || objc_msgSend(v17, "hasMediaCharacteristic:", v15))
          {
            objc_msgSend(v7, "addObject:", v17);
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v12);
    }

    v18 = MEMORY[0x24BDAC760];
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __79__AVAsset_TVPAudioSubtitleAdditions__tvp_sortedSubtitleAVMediaSelectionOptions__block_invoke;
    v38[3] = &unk_24F15D2D8;
    v39 = v9;
    v40 = v28;
    v19 = v28;
    v20 = v9;
    objc_msgSend(v7, "sortedArrayUsingComparator:", v38);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v31[0] = v18;
    v31[1] = 3221225472;
    v31[2] = __79__AVAsset_TVPAudioSubtitleAdditions__tvp_sortedSubtitleAVMediaSelectionOptions__block_invoke_2;
    v31[3] = &unk_24F15D300;
    v32 = v23;
    v33 = (id)objc_claimAutoreleasedReturnValue();
    v37 = v22;
    v34 = v21;
    v2 = v30;
    v35 = v30;
    v36 = a1;
    v24 = v21;
    v25 = v33;
    v26 = v23;
    objc_msgSend(v24, "enumerateObjectsUsingBlock:", v31);

    v4 = v29;
  }

  return v2;
}

@end
