@implementation SREMusicRetrieval

- (SREMusicRetrieval)initWithLocale:(id)a3 queue:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  SREMusicRetrieval *v10;
  SREMusicRetrieval *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SREMusicRetrieval;
  v10 = -[SREMusicRetrieval init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_locale, a3);
    objc_storeStrong((id *)&v11->_queue, a4);
  }

  return v11;
}

- (BOOL)isMusicRecEligible:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[SREMusicRetrieval _parseQueryString:](self, "_parseQueryString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SREMusicRetrieval locale](self, "locale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("en_US"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)retrieveMusicWithQuery:(id)a3 queryID:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  SREMusicFeatureExtraction *v13;
  NSObject *v14;
  NSObject *v15;
  unint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  SREMusicModelQuery *v44;
  SREMusicFeatureExtraction *v45;
  __CFString *v46;
  _OWORD v47[4];
  id v48;
  _BYTE v49[128];
  uint8_t buf[4];
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SREMusicRetrieval locale](self, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("en_US"));

  if ((v9 & 1) != 0)
  {
    -[SREMusicRetrieval _parseQueryString:](self, "_parseQueryString:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    logForCSLogCategoryRecs();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[SREMusicRetrieval retrieveMusicWithQuery:queryID:].cold.6();

      v13 = objc_alloc_init(SREMusicFeatureExtraction);
      logForCSLogCategoryRecs();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = a4 - 1;
      if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_247974000, v15, OS_SIGNPOST_INTERVAL_BEGIN, a4, "SREFeatureExtractionLatency", (const char *)&unk_247989C85, buf, 2u);
      }

      v48 = 0;
      -[SREMusicFeatureExtraction retrieveNowPlayingHistoryWithLength:error:](v13, "retrieveNowPlayingHistoryWithLength:error:", 10, &v48);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v48;
      logForCSLogCategoryRecs();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_247974000, v20, OS_SIGNPOST_INTERVAL_END, a4, "SREFeatureExtractionLatency", (const char *)&unk_247989C85, buf, 2u);
      }

      logForCSLogCategoryRecs();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (!v17 || v18)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[SREMusicRetrieval retrieveMusicWithQuery:queryID:].cold.1();

        -[SREMusicRetrieval _callCompletionHandler:](self, "_callCompletionHandler:", v18);
      }
      else
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[SREMusicRetrieval retrieveMusicWithQuery:queryID:].cold.5();

        +[SREMusicRetrievalModel sharedInstance](SREMusicRetrievalModel, "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          objc_msgSend(v10, "genres");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "count");

          if (v25)
          {
            memset(v47, 0, sizeof(v47));
            objc_msgSend(v10, "genres");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", v47, v49, 16))
              v27 = (const __CFString *)**((id **)&v47[0] + 1);
            else
              v27 = &stru_251905500;

          }
          else
          {
            v27 = &stru_251905500;
          }
          v45 = v13;
          logForCSLogCategoryRecs();
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = v32;
          if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_247974000, v33, OS_SIGNPOST_INTERVAL_BEGIN, a4, "SREModelInferrenceLatency", (const char *)&unk_247989C85, buf, 2u);
          }

          v46 = (__CFString *)v27;
          v44 = -[SREMusicModelQuery initWithGenreID:]([SREMusicModelQuery alloc], "initWithGenreID:", v27);
          objc_msgSend(v23, "inferenceWithSequence:query:error:", v17);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 0;
          logForCSLogCategoryRecs();
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = v35;
          if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_247974000, v36, OS_SIGNPOST_INTERVAL_END, a4, "SREModelInferrenceLatency", (const char *)&unk_247989C85, buf, 2u);
          }

          logForCSLogCategoryRecs();
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = v37;
          if (v34)
          {
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              -[SREMusicRetrieval retrieveMusicWithQuery:queryID:].cold.4();

            -[SREMusicRetrieval _removeRecentlyPlayedCandidateAdamIDs:recentPlayed:](self, "_removeRecentlyPlayedCandidateAdamIDs:recentPlayed:", v34, v17);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            logForCSLogCategoryRecs();
            v40 = objc_claimAutoreleasedReturnValue();
            v41 = v40;
            if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_247974000, v41, OS_SIGNPOST_INTERVAL_BEGIN, a4, "SREMedaDataFetchingLatency", (const char *)&unk_247989C85, buf, 2u);
            }

            -[SREMusicRetrieval _callMetadataEndpointWithAdamIDs:queryIntent:](self, "_callMetadataEndpointWithAdamIDs:queryIntent:", v39, v10);
            logForCSLogCategoryRecs();
            v42 = objc_claimAutoreleasedReturnValue();
            v43 = v42;
            if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_247974000, v43, OS_SIGNPOST_INTERVAL_END, a4, "SREMedaDataFetchingLatency", (const char *)&unk_247989C85, buf, 2u);
            }

          }
          else
          {
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              -[SREMusicRetrieval retrieveMusicWithQuery:queryID:].cold.3((uint64_t)v18, v38);

            -[SREMusicRetrieval _callCompletionHandler:](self, "_callCompletionHandler:", v18);
          }
          v13 = v45;

        }
        else
        {
          logForCSLogCategoryRecs();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            -[SREMusicRetrieval retrieveMusicWithQuery:queryID:].cold.2();

          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SREMusicRetrieval"), -1, 0);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          -[SREMusicRetrieval _callCompletionHandler:](self, "_callCompletionHandler:", v18);
        }

      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_247974000, v12, OS_LOG_TYPE_DEFAULT, "Music recommendation skipped because of no music intent.", buf, 2u);
      }

      -[SREMusicRetrieval _callCompletionHandler:](self, "_callCompletionHandler:", 0);
    }

  }
  else
  {
    logForCSLogCategoryRecs();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      -[SREMusicRetrieval locale](self, "locale");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "localeIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v51 = v30;
      _os_log_impl(&dword_247974000, v28, OS_LOG_TYPE_DEFAULT, "Music recommendation skipped for locale: %@", buf, 0xCu);

    }
    -[SREMusicRetrieval _callCompletionHandler:](self, "_callCompletionHandler:", 0);
  }

}

- (void)_callMetadataEndpointWithAdamIDs:(id)a3 queryIntent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  _BOOL4 v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void (**v42)(_QWORD, _QWORD);
  NSObject *v43;
  id v44;
  SREMusicMetadataRetrieval *v45;
  void *v46;
  SREMusicRetrieval *v47;
  id v48;
  void *v49;
  id obj;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v7, "genres");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
      v10 = 200;
    else
      v10 = 25;
    v11 = v6;
    v47 = self;
    v48 = v6;
    if (objc_msgSend(v11, "count") > v10)
    {
      objc_msgSend(v11, "subarrayWithRange:", 0, v10);
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v12;
    }
    v60 = 0;
    v45 = objc_alloc_init(SREMusicMetadataRetrieval);
    v46 = v11;
    -[SREMusicMetadataRetrieval retrieveMusicMetadata:error:](v45, "retrieveMusicMetadata:error:", v11, &v60);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v60;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = v13;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
    if (v14)
    {
      v15 = v14;
      v51 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v57 != v51)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          v52 = 0u;
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          objc_msgSend(v17, "genreIDs");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v52, v69, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v53;
            while (2)
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v53 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
                objc_msgSend(v7, "genres");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v23) = objc_msgSend(v24, "containsObject:", v23);

                if ((v23 & 1) != 0)
                {
                  v25 = 0;
                  goto LABEL_22;
                }
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v52, v69, 16);
              if (v20)
                continue;
              break;
            }
          }
          v25 = 1;
LABEL_22:

          objc_msgSend(v7, "genres");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "count");

          if (v25 && v27)
          {
            logForCSLogCategoryRecs();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              v29 = objc_msgSend(v17, "trackId");
              objc_msgSend(v17, "trackName");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "genresDebugString");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218498;
              v62 = v29;
              v63 = 2112;
              v64 = v30;
              v65 = 2112;
              v66 = v31;
              _os_log_impl(&dword_247974000, v28, OS_LOG_TYPE_DEFAULT, "Recommendation candidate got filtered by genre mismatch. ADAM ID: %ld  name:%@  genre:%@", buf, 0x20u);

            }
LABEL_33:

            continue;
          }
          objc_msgSend(v17, "artworkURL");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "length");

          logForCSLogCategoryRecs();
          v28 = objc_claimAutoreleasedReturnValue();
          v34 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
          if (!v33)
          {
            if (v34)
            {
              v39 = objc_msgSend(v17, "trackId");
              objc_msgSend(v17, "artworkURL");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218242;
              v62 = v39;
              v63 = 2112;
              v64 = v40;
              _os_log_impl(&dword_247974000, v28, OS_LOG_TYPE_DEFAULT, "Skipped recommendation candidate %lu with invalid artworkURL: %@", buf, 0x16u);

            }
            goto LABEL_33;
          }
          if (v34)
          {
            v35 = objc_msgSend(v17, "trackId");
            objc_msgSend(v17, "trackName");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "genresDebugString");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "artistName");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218754;
            v62 = v35;
            v63 = 2112;
            v64 = v36;
            v65 = 2112;
            v66 = v37;
            v67 = 2112;
            v68 = v38;
            _os_log_impl(&dword_247974000, v28, OS_LOG_TYPE_DEFAULT, "Music Recs Result: %ld %@ Genre=%@ ARTIST_NAME=%@", buf, 0x2Au);

          }
          objc_msgSend(v49, "addObject:", v17);
          if ((unint64_t)objc_msgSend(v49, "count") > 2)
            goto LABEL_36;
        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
      }
      while (v15);
    }
LABEL_36:

    logForCSLogCategoryRecs();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      -[SREMusicRetrieval _callMetadataEndpointWithAdamIDs:queryIntent:].cold.1();

    v6 = v48;
    if (objc_msgSend(v49, "count"))
    {
      -[SREMusicRetrieval candidatesHandler](v47, "candidatesHandler");
      v42 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v42)[2](v42, v49);

    }
    -[SREMusicRetrieval _callCompletionHandler:](v47, "_callCompletionHandler:", 0);

  }
  else
  {
    logForCSLogCategoryRecs();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_247974000, v43, OS_LOG_TYPE_DEFAULT, "Music recommendation metadata call skipped due to no candidates.", buf, 2u);
    }

    -[SREMusicRetrieval _callCompletionHandler:](self, "_callCompletionHandler:", 0);
  }

}

- (id)_parseQueryString:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[164];
  _QWORD v24[166];

  v24[164] = *MEMORY[0x24BDAC8D0];
  v18 = a3;
  +[SREQueryIntent queryIntentWithGenres:](SREQueryIntent, "queryIntentWithGenres:", MEMORY[0x24BDBD1A8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SREQueryIntent queryIntentWithGenres:](SREQueryIntent, "queryIntentWithGenres:", &unk_251907DD8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SREQueryIntent queryIntentWithGenres:](SREQueryIntent, "queryIntentWithGenres:", &unk_251907DF0);
  v5 = objc_claimAutoreleasedReturnValue();
  +[SREQueryIntent queryIntentWithGenres:](SREQueryIntent, "queryIntentWithGenres:", &unk_251907E08);
  v6 = objc_claimAutoreleasedReturnValue();
  +[SREQueryIntent queryIntentWithGenres:](SREQueryIntent, "queryIntentWithGenres:", &unk_251907E20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[SREQueryIntent queryIntentWithGenres:](SREQueryIntent, "queryIntentWithGenres:", &unk_251907E38);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SREQueryIntent queryIntentWithGenres:](SREQueryIntent, "queryIntentWithGenres:", &unk_251907E50);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[SREQueryIntent queryIntentWithGenres:](SREQueryIntent, "queryIntentWithGenres:", &unk_251907E68);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SREQueryIntent queryIntentWithGenres:](SREQueryIntent, "queryIntentWithGenres:", &unk_251907E80);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[SREQueryIntent queryIntentWithGenres:](SREQueryIntent, "queryIntentWithGenres:", &unk_251907E98);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[SREQueryIntent queryIntentWithGenres:](SREQueryIntent, "queryIntentWithGenres:", &unk_251907EB0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SREQueryIntent queryIntentWithGenres:](SREQueryIntent, "queryIntentWithGenres:", &unk_251907EC8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SREQueryIntent queryIntentWithGenres:](SREQueryIntent, "queryIntentWithGenres:", &unk_251907EE0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = CFSTR("music");
  v23[1] = CFSTR("musi");
  v24[0] = v3;
  v24[1] = v3;
  v23[2] = CFSTR("play music");
  v23[3] = CFSTR("play musi");
  v24[2] = v3;
  v24[3] = v3;
  v23[4] = CFSTR("song");
  v23[5] = CFSTR("play song");
  v24[4] = v3;
  v24[5] = v3;
  v23[6] = CFSTR("play a song");
  v23[7] = CFSTR("songs");
  v24[6] = v3;
  v24[7] = v3;
  v23[8] = CFSTR("play songs");
  v23[9] = CFSTR("hiphop");
  v24[8] = v3;
  v24[9] = v4;
  v23[10] = CFSTR("hip hop");
  v23[11] = CFSTR("hip-hop");
  v24[10] = v4;
  v24[11] = v4;
  v23[12] = CFSTR("hiphop music");
  v23[13] = CFSTR("hip hop music");
  v24[12] = v4;
  v24[13] = v4;
  v23[14] = CFSTR("hip-hop music");
  v23[15] = CFSTR("hiphop musi");
  v24[14] = v4;
  v24[15] = v4;
  v23[16] = CFSTR("hip hop musi");
  v23[17] = CFSTR("hip-hop musi");
  v24[16] = v4;
  v24[17] = v4;
  v23[18] = CFSTR("hiphop song");
  v23[19] = CFSTR("hip hop song");
  v24[18] = v4;
  v24[19] = v4;
  v23[20] = CFSTR("hip-hop song");
  v23[21] = CFSTR("hiphop songs");
  v24[20] = v4;
  v24[21] = v4;
  v23[22] = CFSTR("hip hop songs");
  v23[23] = CFSTR("hip-hop songs");
  v24[22] = v4;
  v24[23] = v4;
  v23[24] = CFSTR("play hiphop");
  v23[25] = CFSTR("play hip hop");
  v24[24] = v4;
  v24[25] = v4;
  v23[26] = CFSTR("play hip-hop");
  v23[27] = CFSTR("play hiphop music");
  v24[26] = v4;
  v24[27] = v4;
  v23[28] = CFSTR("play hip hop music");
  v23[29] = CFSTR("play hip-hop music");
  v24[28] = v4;
  v24[29] = v4;
  v23[30] = CFSTR("play hiphop musi");
  v23[31] = CFSTR("play hip hop musi");
  v24[30] = v4;
  v24[31] = v4;
  v23[32] = CFSTR("play hip-hop musi");
  v23[33] = CFSTR("play hiphop song");
  v24[32] = v4;
  v24[33] = v4;
  v23[34] = CFSTR("play hip hop song");
  v23[35] = CFSTR("play hip-hop song");
  v24[34] = v4;
  v24[35] = v4;
  v23[36] = CFSTR("play hiphop songs");
  v23[37] = CFSTR("play hip hop songs");
  v24[36] = v4;
  v24[37] = v4;
  v23[38] = CFSTR("play hip-hop songs");
  v23[39] = CFSTR("rap");
  v24[38] = v4;
  v24[39] = v4;
  v23[40] = CFSTR("rap music");
  v23[41] = CFSTR("rap musi");
  v24[40] = v4;
  v24[41] = v4;
  v23[42] = CFSTR("rap song");
  v23[43] = CFSTR("rap songs");
  v24[42] = v4;
  v24[43] = v4;
  v23[44] = CFSTR("play rap");
  v23[45] = CFSTR("play rap music");
  v24[44] = v4;
  v24[45] = v4;
  v23[46] = CFSTR("play rap song");
  v23[47] = CFSTR("play rap songs");
  v24[46] = v4;
  v24[47] = v4;
  v23[48] = CFSTR("pop music");
  v23[49] = CFSTR("pop musi");
  v17 = (void *)v5;
  v24[48] = v5;
  v24[49] = v5;
  v23[50] = CFSTR("play pop music");
  v23[51] = CFSTR("pop song");
  v24[50] = v5;
  v24[51] = v5;
  v23[52] = CFSTR("play pop song");
  v23[53] = CFSTR("pop songs");
  v24[52] = v5;
  v24[53] = v5;
  v23[54] = CFSTR("play pop songs");
  v23[55] = CFSTR("rock music");
  v24[54] = v5;
  v16 = (void *)v6;
  v24[55] = v6;
  v23[56] = CFSTR("rock musi");
  v23[57] = CFSTR("play rock");
  v24[56] = v6;
  v24[57] = v6;
  v23[58] = CFSTR("play rock music");
  v23[59] = CFSTR("rock song");
  v24[58] = v6;
  v24[59] = v6;
  v23[60] = CFSTR("play rock song");
  v23[61] = CFSTR("rock songs");
  v24[60] = v6;
  v24[61] = v6;
  v23[62] = CFSTR("play rock songs");
  v23[63] = CFSTR("alternative music");
  v24[62] = v6;
  v24[63] = v21;
  v23[64] = CFSTR("alternative musi");
  v24[64] = v21;
  v23[65] = CFSTR("play alternative music");
  v24[65] = v21;
  v23[66] = CFSTR("alternative song");
  v24[66] = v21;
  v23[67] = CFSTR("play alternative song");
  v24[67] = v21;
  v23[68] = CFSTR("alternative songs");
  v24[68] = v21;
  v23[69] = CFSTR("play alternative songs");
  v24[69] = v21;
  v23[70] = CFSTR("r&b");
  v24[70] = v7;
  v23[71] = CFSTR("rhythm and blues");
  v24[71] = v7;
  v23[72] = CFSTR("r&b music");
  v24[72] = v7;
  v23[73] = CFSTR("r&b musi");
  v24[73] = v7;
  v23[74] = CFSTR("play r&b music");
  v24[74] = v7;
  v23[75] = CFSTR("r&b song");
  v24[75] = v7;
  v23[76] = CFSTR("play r&b song");
  v24[76] = v7;
  v23[77] = CFSTR("r&b songs");
  v24[77] = v7;
  v23[78] = CFSTR("play r&b songs");
  v24[78] = v7;
  v23[79] = CFSTR("soul music");
  v24[79] = v7;
  v23[80] = CFSTR("soul musi");
  v24[80] = v7;
  v23[81] = CFSTR("play soul music");
  v24[81] = v7;
  v23[82] = CFSTR("soul song");
  v24[82] = v7;
  v23[83] = CFSTR("play soul song");
  v24[83] = v7;
  v23[84] = CFSTR("soul songs");
  v24[84] = v7;
  v23[85] = CFSTR("play soul songs");
  v24[85] = v7;
  v23[86] = CFSTR("country music");
  v24[86] = v19;
  v23[87] = CFSTR("country musi");
  v24[87] = v19;
  v23[88] = CFSTR("play country music");
  v24[88] = v19;
  v23[89] = CFSTR("country song");
  v24[89] = v19;
  v23[90] = CFSTR("play country song");
  v24[90] = v19;
  v23[91] = CFSTR("country songs");
  v24[91] = v19;
  v23[92] = CFSTR("play country songs");
  v24[92] = v19;
  v23[93] = CFSTR("soundtrack");
  v24[93] = v8;
  v23[94] = CFSTR("soundtracks");
  v24[94] = v8;
  v23[95] = CFSTR("soundtrack music");
  v24[95] = v8;
  v23[96] = CFSTR("soundtrack musi");
  v24[96] = v8;
  v23[97] = CFSTR("play soundtrack");
  v24[97] = v8;
  v23[98] = CFSTR("play soundtracks");
  v24[98] = v8;
  v23[99] = CFSTR("play soundtrack music");
  v24[99] = v8;
  v23[100] = CFSTR("soundtrack song");
  v24[100] = v8;
  v23[101] = CFSTR("play soundtrack song");
  v24[101] = v8;
  v23[102] = CFSTR("soundtrack songs");
  v24[102] = v8;
  v23[103] = CFSTR("play soundtrack songs");
  v24[103] = v8;
  v23[104] = CFSTR("dance music");
  v24[104] = v20;
  v23[105] = CFSTR("dance musi");
  v24[105] = v20;
  v23[106] = CFSTR("play dance music");
  v24[106] = v20;
  v23[107] = CFSTR("dance song");
  v24[107] = v20;
  v23[108] = CFSTR("play dance song");
  v24[108] = v20;
  v23[109] = CFSTR("dance songs");
  v24[109] = v20;
  v23[110] = CFSTR("play dance songs");
  v24[110] = v20;
  v23[111] = CFSTR("electronic music");
  v24[111] = v22;
  v23[112] = CFSTR("electronic musi");
  v24[112] = v22;
  v23[113] = CFSTR("play electronic music");
  v24[113] = v22;
  v23[114] = CFSTR("electronic song");
  v24[114] = v22;
  v23[115] = CFSTR("play electronic song");
  v24[115] = v22;
  v23[116] = CFSTR("electronic songs");
  v24[116] = v22;
  v23[117] = CFSTR("play electronic songs");
  v24[117] = v22;
  v23[118] = CFSTR("children music");
  v24[118] = v9;
  v23[119] = CFSTR("child music");
  v24[119] = v9;
  v23[120] = CFSTR("children's music");
  v24[120] = v9;
  v23[121] = CFSTR("play children music");
  v24[121] = v9;
  v23[122] = CFSTR("play child music");
  v24[122] = v9;
  v23[123] = CFSTR("play children's music");
  v24[123] = v9;
  v23[124] = CFSTR("children song");
  v24[124] = v9;
  v23[125] = CFSTR("child song");
  v24[125] = v9;
  v23[126] = CFSTR("children's song");
  v24[126] = v9;
  v23[127] = CFSTR("play children song");
  v24[127] = v9;
  v23[128] = CFSTR("play child song");
  v24[128] = v9;
  v23[129] = CFSTR("play children's song");
  v24[129] = v9;
  v23[130] = CFSTR("children songs");
  v24[130] = v9;
  v23[131] = CFSTR("child songs");
  v24[131] = v9;
  v23[132] = CFSTR("children's songs");
  v24[132] = v9;
  v23[133] = CFSTR("play children songs");
  v24[133] = v9;
  v23[134] = CFSTR("play child songs");
  v24[134] = v9;
  v23[135] = CFSTR("play children's songs");
  v24[135] = v9;
  v23[136] = CFSTR("kids music");
  v24[136] = v9;
  v23[137] = CFSTR("play kids music");
  v24[137] = v9;
  v23[138] = CFSTR("kid's music");
  v24[138] = v9;
  v23[139] = CFSTR("play kid's music");
  v24[139] = v9;
  v23[140] = CFSTR("kids song");
  v24[140] = v9;
  v23[141] = CFSTR("play kids song");
  v24[141] = v9;
  v23[142] = CFSTR("kid's song");
  v24[142] = v9;
  v23[143] = CFSTR("play kid's song");
  v24[143] = v9;
  v23[144] = CFSTR("kids songs");
  v24[144] = v9;
  v23[145] = CFSTR("play kids songs");
  v24[145] = v9;
  v23[146] = CFSTR("kid's songs");
  v24[146] = v9;
  v23[147] = CFSTR("play kid's songs");
  v24[147] = v9;
  v23[148] = CFSTR("jazz");
  v24[148] = v10;
  v23[149] = CFSTR("jazz music");
  v24[149] = v10;
  v23[150] = CFSTR("jazz musi");
  v24[150] = v10;
  v23[151] = CFSTR("play jazz");
  v24[151] = v10;
  v23[152] = CFSTR("play jazz music");
  v24[152] = v10;
  v23[153] = CFSTR("jazz song");
  v24[153] = v10;
  v23[154] = CFSTR("play jazz song");
  v24[154] = v10;
  v23[155] = CFSTR("jazz songs");
  v24[155] = v10;
  v23[156] = CFSTR("play jazz songs");
  v24[156] = v10;
  v23[157] = CFSTR("classical music");
  v24[157] = v11;
  v23[158] = CFSTR("classical musi");
  v23[159] = CFSTR("play classical music");
  v23[160] = CFSTR("classical song");
  v23[161] = CFSTR("play classical song");
  v23[162] = CFSTR("classical songs");
  v23[163] = CFSTR("play classical songs");
  v24[158] = v11;
  v24[159] = v11;
  v24[160] = v11;
  v24[161] = v11;
  v24[162] = v11;
  v24[163] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 164);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_removeRecentlyPlayedCandidateAdamIDs:(id)a3 recentPlayed:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  NSObject *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v23 = v6;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v12), "adamID", v23));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        if ((unint64_t)objc_msgSend(v7, "count") > 9)
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
          if (v10)
            goto LABEL_4;
          break;
        }
      }
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v15 = v5;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          if ((objc_msgSend(v7, "containsObject:", v20, v23) & 1) != 0)
          {
            logForCSLogCategoryRecs();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v33 = v20;
              _os_log_impl(&dword_247974000, v21, OS_LOG_TYPE_DEFAULT, "Music recommendation candidate got removed due to recently played. AdamID=%@", buf, 0xCu);
            }

          }
          else
          {
            objc_msgSend(v14, "addObject:", v20);
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
      }
      while (v17);
    }

    v6 = v23;
  }
  else
  {
    v14 = v5;
  }

  return v14;
}

- (void)_callCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__SREMusicRetrieval__callCompletionHandler___block_invoke;
  v7[3] = &unk_2519053E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __44__SREMusicRetrieval__callCompletionHandler___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (id)candidatesHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setCandidatesHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong(&self->completionHandler, 0);
  objc_storeStrong(&self->candidatesHandler, 0);
}

- (void)retrieveMusicWithQuery:queryID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_247974000, v0, v1, "Music recommendation dropped because of feature extraction failure.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)retrieveMusicWithQuery:queryID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_247974000, v0, v1, "Music recommendation dropped because of no shared model instance.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)retrieveMusicWithQuery:(uint64_t)a1 queryID:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_247974000, a2, OS_LOG_TYPE_ERROR, "Music recommendation dropped because of model inference error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)retrieveMusicWithQuery:queryID:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_247974000, v0, v1, "Music retrieval starting post processing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)retrieveMusicWithQuery:queryID:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_247974000, v0, v1, "Music retrieval starting model inference.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)retrieveMusicWithQuery:queryID:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_247974000, v0, v1, "Music retrieval starting feature extraction.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_callMetadataEndpointWithAdamIDs:queryIntent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_247974000, v0, v1, "======================= End of a Music Recs Retrieval =======================", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
