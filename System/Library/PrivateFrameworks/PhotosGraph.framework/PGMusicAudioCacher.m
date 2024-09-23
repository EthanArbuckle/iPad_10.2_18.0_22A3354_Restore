@implementation PGMusicAudioCacher

+ (void)cacheSongAudioForAdamIDs:(id)a3 progressReporter:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  __int16 v16[8];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  if (+[PGMusicCatalogMonitor canAccessMediaLibrary](PGMusicCatalogMonitor, "canAccessMediaLibrary"))
  {
    objc_msgSend(MEMORY[0x1E0CC2408], "defaultMediaLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "photosMemoriesPlaylist");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(a1, "_addSongsWithAdamIDs:toPlaylist:inLibrary:progressReporter:completionHandler:", v8, v12, v11, v9, v10);
    }
    else
    {
      +[PGError errorWithCode:description:](PGError, "errorWithCode:description:", -3, CFSTR("[MemoriesMusic] Photos playlist is missing"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v15);

    }
  }
  else
  {
    +[PGLogging memoriesMusicLogging](PGLogging, "memoriesMusicLogging");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "loggingConnection");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16[0] = 0;
      _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, "[MemoriesMusic] MusicAudioCacher does not have access to the MediaLibrary so will not cache songs in Photos memories playlist.", (uint8_t *)v16, 2u);
    }

    v10[2](v10, 1, 0);
  }

}

+ (void)removeSongsCachedForPhotosWithAdamIDs:(id)a3 progressReporter:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint32_t denom;
  uint32_t numer;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  os_signpost_id_t spid;
  os_signpost_id_t spida;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  id v43;
  NSObject *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  NSObject *v48;
  void (**v49)(id, uint64_t, _QWORD);
  uint64_t v50;
  os_signpost_id_t v51;
  mach_timebase_info v52;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  double v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  if (!objc_msgSend(v8, "isCancelledWithProgress:", 0.0))
  {
    +[PGLogging memoriesMusicLogging](PGLogging, "memoriesMusicLogging");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loggingConnection");
    v12 = objc_claimAutoreleasedReturnValue();

    if (!+[PGMusicCatalogMonitor canAccessMediaLibrary](PGMusicCatalogMonitor, "canAccessMediaLibrary"))
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_INFO, "[MemoriesMusic] MusicAudioCacher does not have access to the MediaLibrary so will not remove input cached songs from Photos memories playlist.", buf, 2u);
      }
      v9[2](v9, 1, 0);
      goto LABEL_37;
    }
    objc_msgSend(MEMORY[0x1E0CC2408], "defaultMediaLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "photosMemoriesPlaylist");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA237000, v12, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Failed to get photosMemoriesPlaylist from MediaLibrary", buf, 2u);
      }
      +[PGError errorWithCode:description:](PGError, "errorWithCode:description:", -3, CFSTR("[MemoriesMusic] Photos playlist is missing"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v34);
      goto LABEL_36;
    }
    v41 = v13;
    v42 = v12;
    v15 = v12;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v55 = (const char *)objc_msgSend(v7, "count");
      _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "[MemoriesMusic] MusicAudioCacher will remove %lu items from Photos playlist cache", buf, 0xCu);
    }

    v16 = v15;
    v17 = os_signpost_id_generate(v16);
    v18 = v16;
    v19 = v18;
    v39 = v17 - 1;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "RemoveSongsFromMusicAudioCache", ", buf, 2u);
    }
    spid = v17;
    v44 = v19;

    info = 0;
    mach_timebase_info(&info);
    v38 = mach_absolute_time();
    v43 = v7;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v14;
    objc_msgSend(v14, "items");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "count"))
    {
      v23 = 0;
      v24 = *MEMORY[0x1E0CC1FC8];
      do
      {
        objc_msgSend(v22, "objectAtIndexedSubscript:", v23, spid);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "valueForProperty:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringValue");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27 && objc_msgSend(v20, "containsObject:", v27))
        {
          objc_msgSend(v21, "addObject:", v25);
          objc_msgSend(v45, "addIndex:", v23);
        }

        ++v23;
      }
      while (v23 < objc_msgSend(v22, "count"));
    }
    if (objc_msgSend(v21, "count", spid))
    {
      v12 = v42;
      if (!objc_msgSend(v8, "isCancelledWithProgress:", 0.4))
      {
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __95__PGMusicAudioCacher_removeSongsCachedForPhotosWithAdamIDs_progressReporter_completionHandler___block_invoke;
        v46[3] = &unk_1E842F3E0;
        v49 = v9;
        v47 = v8;
        v50 = v38;
        v52 = info;
        v48 = v44;
        v51 = spida;
        v14 = v40;
        objc_msgSend(v40, "removeItems:atFilteredIndexes:completionBlock:", v21, v45, v46);

        v13 = v41;
        goto LABEL_35;
      }
      +[PGError errorForCode:](PGError, "errorForCode:", -4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v28);

      v29 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v32 = v44;
      v33 = v32;
      v14 = v40;
      if (v39 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v33, OS_SIGNPOST_INTERVAL_END, spida, "RemoveSongsFromMusicAudioCache", ", buf, 2u);
      }

      v13 = v41;
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        goto LABEL_35;
    }
    else
    {
      v9[2](v9, 1, 0);
      objc_msgSend(v8, "isCancelledWithProgress:", 1.0);
      v29 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v35 = v44;
      v33 = v35;
      v13 = v41;
      v12 = v42;
      if (v39 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v33, OS_SIGNPOST_INTERVAL_END, spida, "RemoveSongsFromMusicAudioCache", ", buf, 2u);
      }

      v14 = v40;
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        goto LABEL_35;
    }
    *(_DWORD *)buf = 136315394;
    v55 = "RemoveSongsFromMusicAudioCache";
    v56 = 2048;
    v57 = (float)((float)((float)((float)(v29 - v38) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v33, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
LABEL_35:

    v7 = v43;
    v34 = v44;
LABEL_36:

LABEL_37:
    goto LABEL_38;
  }
  +[PGError errorForCode:](PGError, "errorForCode:", -4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v10);

LABEL_38:
}

+ (void)removeAllSongsCachedForPhotosWithProgressReporter:(id)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  mach_timebase_info v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  if (objc_msgSend(v5, "isCancelledWithProgress:", 0.0))
  {
    +[PGError errorForCode:](PGError, "errorForCode:", -4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v7);
LABEL_19:

    goto LABEL_20;
  }
  if (+[PGMusicCatalogMonitor canAccessMediaLibrary](PGMusicCatalogMonitor, "canAccessMediaLibrary"))
  {
    objc_msgSend(MEMORY[0x1E0CC2408], "defaultMediaLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photosMemoriesPlaylist");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      +[PGLogging memoriesMusicLogging](PGLogging, "memoriesMusicLogging");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "loggingConnection");
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = os_signpost_id_generate(v10);
      v12 = v10;
      v13 = v12;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "RemoveAllSongsFromMusicAudioCache", ", buf, 2u);
      }

      info = 0;
      mach_timebase_info(&info);
      v14 = mach_absolute_time();
      objc_msgSend(v8, "removeAllItems");
      v15 = mach_absolute_time();
      v16 = info;
      v17 = v13;
      v18 = v17;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v18, OS_SIGNPOST_INTERVAL_END, v11, "RemoveAllSongsFromMusicAudioCache", ", buf, 2u);
      }

      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "RemoveAllSongsFromMusicAudioCache";
        v24 = 2048;
        v25 = (float)((float)((float)((float)(v15 - v14) * (float)v16.numer) / (float)v16.denom) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v18, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      v6[2](v6, 1, 0);
      objc_msgSend(v5, "isCancelledWithProgress:", 1.0);
    }
    else
    {
      +[PGError errorWithCode:description:](PGError, "errorWithCode:description:", -3, CFSTR("[MemoriesMusic] Photos playlist is missing"));
      v18 = objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0, v18);
    }

    goto LABEL_19;
  }
  +[PGLogging memoriesMusicLogging](PGLogging, "memoriesMusicLogging");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "loggingConnection");
  v20 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_INFO, "[MemoriesMusic] MusicAudioCacher does not have access to the MediaLibrary so will not remove all cached songs from Photos memories playlist.", buf, 2u);
  }

  v6[2](v6, 1, 0);
LABEL_20:

}

+ (id)songPropertiesByAdamIDCachedForPhotosWithError:(id *)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  NSObject *v34;
  id obj;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[16];
  _BYTE v51[128];
  _BYTE v52[128];
  _QWORD v53[14];

  v53[12] = *MEMORY[0x1E0C80C00];
  if (+[PGMusicCatalogMonitor canAccessMediaLibrary](PGMusicCatalogMonitor, "canAccessMediaLibrary"))
  {
    objc_msgSend(MEMORY[0x1E0CC2408], "defaultMediaLibrary");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject photosMemoriesPlaylist](v4, "photosMemoriesPlaylist");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v34 = v4;
      v6 = *MEMORY[0x1E0CC1D88];
      v53[0] = *MEMORY[0x1E0CC1FD8];
      v53[1] = v6;
      v7 = *MEMORY[0x1E0CC1D98];
      v53[2] = *MEMORY[0x1E0CC1EE8];
      v53[3] = v7;
      v8 = *MEMORY[0x1E0CC1E00];
      v53[4] = *MEMORY[0x1E0CC1EB0];
      v53[5] = v8;
      v9 = *MEMORY[0x1E0CC1E98];
      v53[6] = *MEMORY[0x1E0CC1E80];
      v53[7] = v9;
      v10 = *MEMORY[0x1E0CC1E40];
      v53[8] = *MEMORY[0x1E0CC1F78];
      v53[9] = v10;
      v11 = *MEMORY[0x1E0CC1FA0];
      v53[10] = *MEMORY[0x1E0CC1DF0];
      v53[11] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 12);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v5;
      objc_msgSend(v5, "items");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v37 = (id)objc_claimAutoreleasedReturnValue();
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      obj = v12;
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      if (v40)
      {
        v39 = *(_QWORD *)v47;
        v38 = *MEMORY[0x1E0CC1FC8];
        do
        {
          for (i = 0; i != v40; ++i)
          {
            if (*(_QWORD *)v47 != v39)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
            objc_msgSend(v14, "valueForProperty:", v38);
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = (void *)v15;
            if (v15)
            {
              v41 = (void *)v15;
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = 0u;
              v43 = 0u;
              v44 = 0u;
              v45 = 0u;
              v18 = v36;
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
              if (v19)
              {
                v20 = v19;
                v21 = *(_QWORD *)v43;
                do
                {
                  for (j = 0; j != v20; ++j)
                  {
                    if (*(_QWORD *)v43 != v21)
                      objc_enumerationMutation(v18);
                    v23 = *(id *)(*((_QWORD *)&v42 + 1) + 8 * j);
                    v24 = v17;
                    objc_msgSend(v14, "valueForProperty:", v23);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v25)
                      objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, v23);

                  }
                  v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
                }
                while (v20);
              }

              v26 = objc_msgSend(v14, "existsInLibrary");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setObject:forKeyedSubscript:", v27, CFSTR("ExistsInLibrary"));

              v28 = objc_msgSend(v14, "persistentID");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setObject:forKeyedSubscript:", v29, CFSTR("PersistentID"));

              v16 = v41;
              objc_msgSend(v41, "stringValue");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v17, v30);

            }
          }
          v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
        }
        while (v40);
      }

      v5 = v33;
      v4 = v34;
    }
    else if (a3)
    {
      +[PGError errorWithCode:description:](PGError, "errorWithCode:description:", -3, CFSTR("[MemoriesMusic] Photos playlist is missing"));
      v37 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = 0;
    }

  }
  else
  {
    +[PGLogging memoriesMusicLogging](PGLogging, "memoriesMusicLogging");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "loggingConnection");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v4, OS_LOG_TYPE_INFO, "[MemoriesMusic] MusicAudioCacher does not have access to the MediaLibrary so can not read properties of any cached songs.", buf, 2u);
    }
    v37 = (id)MEMORY[0x1E0C9AA70];
  }

  return v37;
}

+ (void)_addSongsWithAdamIDs:(id)a3 toPlaylist:(id)a4 inLibrary:(id)a5 progressReporter:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD, id);
  NSObject *v16;
  void *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  void (**v23)(id, _QWORD, id);
  _QWORD v24[4];
  id v25;
  NSObject *v26;
  id v27;
  id v28;
  uint64_t v29;
  os_signpost_id_t v30;
  uint64_t v31;
  uint8_t buf[8];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, _QWORD, id))a7;
  if (objc_msgSend(v14, "isCancelledWithProgress:", 0.0))
  {
    +[PGError errorForCode:](PGError, "errorForCode:", -4);
    v16 = objc_claimAutoreleasedReturnValue();
    v15[2](v15, 0, v16);
  }
  else
  {
    +[PGLogging memoriesMusicLogging](PGLogging, "memoriesMusicLogging");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "loggingConnection");
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = os_signpost_id_generate(v18);
    v20 = v18;
    v21 = v20;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "AddSongsToMusicAudioCache", ", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    mach_timebase_info((mach_timebase_info_t)buf);
    v22 = mach_absolute_time();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __99__PGMusicAudioCacher__addSongsWithAdamIDs_toPlaylist_inLibrary_progressReporter_completionHandler___block_invoke;
    v24[3] = &unk_1E842F430;
    v25 = v14;
    v23 = v15;
    v30 = v19;
    v31 = *(_QWORD *)buf;
    v28 = v23;
    v29 = v22;
    v26 = v21;
    v27 = v12;
    v16 = v21;
    objc_msgSend(v13, "addStoreItemIDs:referralObject:andAddTracksToCloudLibrary:withCompletion:", v11, 0, 0, v24);

  }
}

void __99__PGMusicAudioCacher__addSongsWithAdamIDs_toPlaylist_inLibrary_progressReporter_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", 0.5))
  {
    v7 = *(_QWORD *)(a1 + 56);
    +[PGError errorForCode:](PGError, "errorForCode:", -4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

    v9 = mach_absolute_time();
    v10 = *(_QWORD *)(a1 + 64);
    v12 = *(_DWORD *)(a1 + 80);
    v11 = *(_DWORD *)(a1 + 84);
    v13 = *(id *)(a1 + 40);
    v14 = v13;
    v15 = *(_QWORD *)(a1 + 72);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v14, OS_SIGNPOST_INTERVAL_END, v15, "AddSongsToMusicAudioCache", ", buf, 2u);
    }

    v16 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
LABEL_13:
      *(_DWORD *)buf = 136315394;
      v33 = "AddSongsToMusicAudioCache";
      v34 = 2048;
      v35 = (float)((float)((float)((float)(v9 - v10) * (float)v12) / (float)v11) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
  else if (v5)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __99__PGMusicAudioCacher__addSongsWithAdamIDs_toPlaylist_inLibrary_progressReporter_completionHandler___block_invoke_21;
    v25[3] = &unk_1E842F408;
    v17 = *(void **)(a1 + 48);
    v28 = *(id *)(a1 + 56);
    v18 = *(id *)(a1 + 32);
    v19 = *(_QWORD *)(a1 + 64);
    v26 = v18;
    v29 = v19;
    v31 = *(_QWORD *)(a1 + 80);
    v20 = *(id *)(a1 + 40);
    v21 = *(_QWORD *)(a1 + 72);
    v27 = v20;
    v30 = v21;
    objc_msgSend(v17, "addMediaItems:completionHandler:", v5, v25);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", 1.0);
    v9 = mach_absolute_time();
    v10 = *(_QWORD *)(a1 + 64);
    v12 = *(_DWORD *)(a1 + 80);
    v11 = *(_DWORD *)(a1 + 84);
    v22 = *(id *)(a1 + 40);
    v23 = v22;
    v24 = *(_QWORD *)(a1 + 72);
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v23, OS_SIGNPOST_INTERVAL_END, v24, "AddSongsToMusicAudioCache", ", buf, 2u);
    }

    v16 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      goto LABEL_13;
  }

}

void __99__PGMusicAudioCacher__addSongsWithAdamIDs_toPlaylist_inLibrary_progressReporter_completionHandler___block_invoke_21(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", 1.0);
  v2 = mach_absolute_time();
  v3 = *(_QWORD *)(a1 + 56);
  v5 = *(_DWORD *)(a1 + 72);
  v4 = *(_DWORD *)(a1 + 76);
  v6 = *(id *)(a1 + 40);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 64);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v7, OS_SIGNPOST_INTERVAL_END, v8, "AddSongsToMusicAudioCache", ", (uint8_t *)&v10, 2u);
  }

  v9 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = 136315394;
    v11 = "AddSongsToMusicAudioCache";
    v12 = 2048;
    v13 = (float)((float)((float)((float)(v2 - v3) * (float)v5) / (float)v4) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v10, 0x16u);
  }
}

void __95__PGMusicAudioCacher_removeSongsCachedForPhotosWithAdamIDs_progressReporter_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    +[PGError errorWithCode:description:](PGError, "errorWithCode:description:", -1, CFSTR("[MemoriesMusic] MPMediaPlaylist -removeItems:completionBlock: call failed"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", 1.0);
  v4 = mach_absolute_time();
  v5 = *(_QWORD *)(a1 + 56);
  v7 = *(_DWORD *)(a1 + 72);
  v6 = *(_DWORD *)(a1 + 76);
  v8 = *(id *)(a1 + 40);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 64);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v9, OS_SIGNPOST_INTERVAL_END, v10, "RemoveSongsFromMusicAudioCache", ", (uint8_t *)&v12, 2u);
  }

  v11 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = 136315394;
    v13 = "RemoveSongsFromMusicAudioCache";
    v14 = 2048;
    v15 = (float)((float)((float)((float)(v4 - v5) * (float)v7) / (float)v6) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v12, 0x16u);
  }

}

@end
