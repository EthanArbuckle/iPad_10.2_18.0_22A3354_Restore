@implementation PGMemoryMusicQuestionUtils

+ (void)enumerateMemoryMusicSuggestionsInPhotoLibrary:(id)a3 block:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;
  _BYTE v25[128];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("score"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v10);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateByAddingTimeInterval:", -31557600.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("creationDate >= %@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v13);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    v24 = 0;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v21;
LABEL_4:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        if (v24)
          break;
        (*((void (**)(id, _QWORD, _QWORD, char *))v5 + 2))(v5, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++), 0, &v24);
        if (v17 == v19)
        {
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          if (v17)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

+ (id)extractStoryRecipeForMemory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "photosGraphProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("storyRecipeData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D752E0]);
    v13 = 0;
    -[NSObject unarchivedRecipeWithData:error:](v6, "unarchivedRecipeWithData:error:", v5, &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      PLStoryGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v15 = v3;
        v16 = 2112;
        v17 = v8;
        _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_ERROR, "[MusicQualityQuestion] Failed to unarchive recipe for %@: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    PLStoryGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v10;
      _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_ERROR, "[MusicQualityQuestion] Unable to extract the StoryRecipeData for memory uuid=%@", buf, 0xCu);

    }
    v7 = 0;
  }

  return v7;
}

+ (id)extractKeySongInfoForMemory:(id)a3 isAppleMusicSubscriber:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  _BOOL4 v38;
  _QWORD v39[4];
  _QWORD v40[4];
  _QWORD v41[4];
  _QWORD v42[5];

  v4 = a4;
  v42[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "extractStoryRecipeForMemory:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "currentStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isCustomized");

    if (v10)
    {
      PLStoryGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v6, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138412290;
        v32 = v12;
        v13 = "[MusicQualityQuestion] PHMemory %@ has a customized recipie so don't use for PhotosChallenge.";
        v14 = v11;
        v15 = OS_LOG_TYPE_DEBUG;
LABEL_7:
        _os_log_impl(&dword_1CA237000, v14, v15, v13, (uint8_t *)&v31, 0xCu);

        goto LABEL_8;
      }
      goto LABEL_8;
    }
    v17 = *MEMORY[0x1E0D759E8];
    objc_msgSend(v8, "seedSongAssetForCatalog:", *MEMORY[0x1E0D759E8]);
    v11 = objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0D759F0];
    objc_msgSend(v8, "seedSongAssetForCatalog:", *MEMORY[0x1E0D759F0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v4 && v11)
    {
      v41[0] = *MEMORY[0x1E0D780B8];
      -[NSObject identifier](v11, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v21;
      v41[1] = *MEMORY[0x1E0D780C0];
      -[NSObject title](v11, "title");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v42[1] = v22;
      v41[2] = *MEMORY[0x1E0D780A8];
      -[NSObject subtitle](v11, "subtitle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v41[3] = *MEMORY[0x1E0D780B0];
      v42[2] = v23;
      v42[3] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      PLStoryGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v31 = 138412290;
        v32 = v16;
        v25 = "[MusicQualityQuestion] Using Apple Music key song %@";
LABEL_16:
        _os_log_impl(&dword_1CA237000, v24, OS_LOG_TYPE_DEBUG, v25, (uint8_t *)&v31, 0xCu);
      }
    }
    else
    {
      if (!v19)
      {
        PLStoryGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v6, "uuid");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 138413058;
          v32 = v29;
          v33 = 2112;
          v34 = 0;
          v35 = 2112;
          v36 = 0;
          v37 = 1024;
          v38 = v4;
          _os_log_impl(&dword_1CA237000, v24, OS_LOG_TYPE_ERROR, "[MusicQualityQuestion] PHMemory %@: Unable to get songInfo. \n keySongFlexMusic=%@ keySongFlexMusic=%@ _isAppleMusicSubscriber=%d", (uint8_t *)&v31, 0x26u);

        }
        v16 = (void *)MEMORY[0x1E0C9AA70];
        goto LABEL_20;
      }
      v39[0] = *MEMORY[0x1E0D780B8];
      objc_msgSend(v19, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v26;
      v39[1] = *MEMORY[0x1E0D780C0];
      objc_msgSend(v20, "title");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v40[1] = v27;
      v39[2] = *MEMORY[0x1E0D780A8];
      objc_msgSend(v20, "subtitle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v39[3] = *MEMORY[0x1E0D780B0];
      v40[2] = v28;
      v40[3] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      PLStoryGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v31 = 138412290;
        v32 = v16;
        v25 = "[MusicQualityQuestion] Using BCE key song %@";
        goto LABEL_16;
      }
    }
LABEL_20:

    goto LABEL_21;
  }
  PLStoryGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v6, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = v12;
    v13 = "[MusicQualityQuestion] Unable to extractStoryRecipeForMemory for PHMemory %@";
    v14 = v11;
    v15 = OS_LOG_TYPE_ERROR;
    goto LABEL_7;
  }
LABEL_8:
  v16 = (void *)MEMORY[0x1E0C9AA70];
LABEL_21:

  return v16;
}

@end
