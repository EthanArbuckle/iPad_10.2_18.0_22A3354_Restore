@implementation PGStoryRecipeBuilder

+ (id)storyRecipeForMemory:(id)a3 appleMusicCuration:(id)a4 flexMusicCuration:(id)a5 shouldAvoidColorGrading:(BOOL)a6 isAppleMusicSubscriber:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v9 = a7;
  v10 = a6;
  v13 = a4;
  objc_msgSend(a1, "_keyFlexSongAssetFromFlexMusicCuration:", a5);
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_appleSongAssetFromAppleMusicCuration:", v13);
  v15 = objc_claimAutoreleasedReturnValue();

  if (v14 | v15)
  {
    objc_msgSend(a1, "_storyRecipeWithKeyAppleMusicSongAsset:keyFlexSongAsset:isAppleMusicSubscriber:shouldAvoidColorGrading:", v15, v14, v9, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a8)
  {
    +[PGError errorWithCode:description:](PGError, "errorWithCode:description:", -3, CFSTR("Neither curation has a valid key song"));
    v16 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)_storyRecipeWithKeyAppleMusicSongAsset:(id)a3 keyFlexSongAsset:(id)a4 isAppleMusicSubscriber:(BOOL)a5 shouldAvoidColorGrading:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;
  id v10;
  id v11;
  void **v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v22;
  void *v23;
  void *v24;

  v6 = a6;
  v7 = a5;
  v9 = a3;
  v10 = a4;
  v11 = (id)*MEMORY[0x1E0D759F0];
  v12 = (void **)MEMORY[0x1E0D759E8];
  v13 = v11;
  if (v7)
  {
    v13 = (id)*MEMORY[0x1E0D759E8];

  }
  objc_msgSend(MEMORY[0x1E0D752C8], "createRecipe");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopyWithZone:", 0);

  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v9
    && (objc_msgSend(v15, "addAsset:", v9),
        objc_msgSend(v9, "identifier"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = *v12,
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, v18),
        v17,
        v13 == v18))
  {
    objc_msgSend(v9, "colorGradeCategory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_14;
  }
  else
  {
    v19 = 0;
    if (!v10)
      goto LABEL_14;
  }
  objc_msgSend(v15, "addAsset:", v10);
  objc_msgSend(v10, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, v11);

  if (v13 == v11 || v19 == 0)
  {
    objc_msgSend(v10, "colorGradeCategory");
    v22 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v22;
  }
LABEL_14:
  v23 = (void *)objc_msgSend(v16, "copy");
  objc_msgSend(v15, "setSeedSongIdentifiersByCatalog:", v23);

  objc_msgSend(MEMORY[0x1E0D752D8], "createStyleWithOriginalColorGradeCategory:customColorGradeKind:songAssetIdentifier:isCustomized:", v19, v6, 0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCurrentStyle:", v24);

  return v15;
}

+ (id)_keyFlexSongAssetFromFlexMusicCuration:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "bestSongSuggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "uid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v30 = v5;
    v31 = v4;
    v6 = v4;
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v6, "tagIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, buf, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v33 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("_"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "count") == 2)
          {
            objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v14);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, buf, 16);
      }
      while (v10);
    }

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Arousal"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Valence"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16 && v17)
    {
      objc_msgSend(v17, "doubleValue");
      objc_msgSend(v16, "doubleValue");
      PFStoryColorGradeCategoryFromValenceArousal();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v30;
      v4 = v31;
    }
    else
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Mood"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (PHMemoryMoodForString())
      {

        v5 = v30;
        v4 = v31;
      }
      else
      {
        v5 = v30;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v21;
          _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PGMemoryPhotosGraphProperties] unsupported Flex Mood tag '%@'", buf, 0xCu);
        }

        v4 = v31;
      }
      PFStoryColorGradeCategoryNamed();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v6, "arousal");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valence");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if ((!v22 || !v23) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v5;
      _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PGMemoryPhotosGraphProperties] Failed to assign proper color grade category for key flex song (%@) because arousal OR valence information was not available.", buf, 0xCu);
    }
    v25 = (void *)MEMORY[0x1E0D752D0];
    v26 = *MEMORY[0x1E0D759F0];
    objc_msgSend(v6, "songName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "artistName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "createAssetWithCategory:subcategory:catalog:songID:title:subtitle:colorGradeCategory:", 1, 1, v26, v5, v27, v28, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)_appleSongAssetFromAppleMusicCuration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "keySongAdamID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "keySongArousal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "keySongValence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 && v6)
    {
      objc_msgSend(v6, "doubleValue");
      objc_msgSend(v5, "doubleValue");
      PFStoryColorGradeCategoryFromValenceArousal();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v4;
        _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PGMemoryPhotosGraphProperties] Failed to assign color grade category for key apple music song (%@) because arousal and valence information was not available.", buf, 0xCu);
      }
      v8 = 0;
    }
    v10 = (void *)MEMORY[0x1E0D752D0];
    v11 = *MEMORY[0x1E0D759E8];
    objc_msgSend(v3, "keySongTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "keySongArtist");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "createAssetWithCategory:subcategory:catalog:songID:title:subtitle:colorGradeCategory:", 1, 1, v11, v4, v12, v13, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
