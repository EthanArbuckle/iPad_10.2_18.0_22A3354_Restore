@implementation SSPommesRanker

+ (id)sharedPommesRanker
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SSPommesRanker_sharedPommesRanker__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPommesRanker_onceToken != -1)
    dispatch_once(&sharedPommesRanker_onceToken, block);
  return (id)sharedPommesRanker_pommesRanker;
}

void __36__SSPommesRanker_sharedPommesRanker__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  v2 = (void *)sharedPommesRanker_pommesRanker;
  sharedPommesRanker_pommesRanker = (uint64_t)v1;

}

- (void)updateScoresForItems:(id)a3 withSectionBundle:(id)a4 userQuery:(id)a5 queryID:(int64_t)a6 currentTime:(double)a7 collectL2Signals:(BOOL)a8 keyboardLanguage:(id)a9 onlyEmbeddingResults:(BOOL)a10
{
  _BOOL8 v11;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  float v35;
  double v36;
  float v37;
  id v38;
  void (*v39)(void *, void *, uint64_t, double);
  NSObject *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int64_t v48;
  id v49;
  id v50;
  _BOOL4 v51;
  void *v52;
  void *v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  int64_t v57;
  __int16 v58;
  int64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  double v65;
  __int16 v66;
  double v67;
  uint64_t v68;

  v11 = a8;
  v68 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a9;
  if (SSSectionIsSyndicatedPhotos(v18))
  {
    if ((unint64_t)objc_msgSend(v17, "count") >= 0x14)
    {
      SSPommesRankerLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        SSRedactString(v19, 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v55 = v18;
        v56 = 2048;
        v57 = a6;
        v58 = 2112;
        v59 = (int64_t)v44;
        v60 = 2048;
        v61 = objc_msgSend(v17, "count");
        _os_log_debug_impl(&dword_1B86C5000, v21, OS_LOG_TYPE_DEBUG, "[bundle=%@][qid=%lu][query=\"%@\"] Following L1Score and L2Score logs will be truncated to first 20 items (total=%lu)", buf, 0x2Au);

      }
    }
    v48 = a6;
    v51 = v11;
    v50 = v18;
    +[SSPommesPhotosRanker sharedInstance](SSPommesPhotosRanker, "sharedInstance");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "UUIDString");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)objc_opt_new();
    v24 = (void *)objc_opt_new();
    if (objc_msgSend(v17, "count"))
    {
      v25 = 0;
      do
      {
        objc_msgSend(v17, "objectAtIndexedSubscript:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "updatePhotosRankingItemScore:userQuery:currentTime:collectL2Signals:keyboardLanguage:uniqueSessionID:onlyEmbeddingResults:amlInputs:", v26, v19, v51, v20, v52, a10, a7, v23);

        if (v25 <= 0x13)
        {
          SSPommesRankerLog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            SSRedactString(v19, 0);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectAtIndexedSubscript:", v25);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "identifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectAtIndexedSubscript:", v25);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "pommesL1Score");
            v36 = v35;
            objc_msgSend(v17, "objectAtIndexedSubscript:", v25);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "l2Score");
            *(_DWORD *)buf = 134219522;
            v55 = (id)(v25 + 1);
            v56 = 2112;
            v57 = (int64_t)v50;
            v58 = 2048;
            v59 = v48;
            v60 = 2112;
            v61 = (uint64_t)v33;
            v62 = 2112;
            v63 = v34;
            v64 = 2048;
            v65 = v36;
            v66 = 2048;
            v67 = v37;
            _os_log_debug_impl(&dword_1B86C5000, v27, OS_LOG_TYPE_DEBUG, "%lu. [bundle=%@][qid=%lu][query=\"%@\"] item %@: L1Score=%.04f, L2Score=%.04f", buf, 0x48u);

          }
        }
        objc_msgSend(v17, "objectAtIndexedSubscript:", v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("spotlight-photoId-%tu"), v25);
        v30 = v19;
        v31 = v20;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setValue:forKey:", v29, v32);

        v20 = v31;
        v19 = v30;

        ++v25;
      }
      while (v25 < objc_msgSend(v17, "count"));
    }
    objc_msgSend(v53, "donateFeatureDictionaries:sessionId:metadata:", v23, v52, v24);

    v18 = v50;
  }
  else
  {
    v38 = v18;
    if ((objc_msgSend(MEMORY[0x1E0DA9B68], "isSafariBundle:", v38) & 1) != 0)
    {
      v39 = updateSafariRankingItemScore;
    }
    else if ((objc_msgSend(MEMORY[0x1E0DA9B68], "isCalendarBundle:", v38) & 1) != 0)
    {
      v39 = updateCalendarRankingItemScore;
    }
    else if (objc_msgSend(MEMORY[0x1E0DA9B68], "isMessagesBundle:", v38))
    {
      v39 = updateMessagesRankingItemScore;
    }
    else
    {
      v39 = updateMailRankingItemScore;
    }

    SSPommesRankerLog();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      SSRedactString(v19, 0);
      v49 = v20;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v55 = v38;
      v56 = 2048;
      v57 = a6;
      v58 = 2112;
      v59 = (int64_t)v41;
      v60 = 2048;
      v61 = objc_msgSend(v17, "count");
      _os_log_impl(&dword_1B86C5000, v40, OS_LOG_TYPE_DEFAULT, "[bundle=%@][qid=%lu][query=\"%@\"] calculating Pommes L2 score for %lu items", buf, 0x2Au);

      v20 = v49;
    }

    if (objc_msgSend(v17, "count"))
    {
      v42 = 0;
      do
      {
        objc_msgSend(v17, "objectAtIndexedSubscript:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (*)(void *, id, int64_t, SSPommesRanker *, _BOOL8, id, double))v39)(v43, v19, a6, self, v11, v20, a7);

        ++v42;
      }
      while (v42 < objc_msgSend(v17, "count"));
    }
  }

}

- (int64_t)compare:(id)a3 to:(id)a4 currentTime:(double)a5
{
  id v6;
  id v7;
  float v8;
  float v9;
  float v10;
  BOOL v11;
  int64_t v12;
  float v13;
  float v14;
  float v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "l2Score");
  v9 = v8;
  objc_msgSend(v7, "l2Score");
  if (v9 == 0.0 || v10 == 0.0)
  {
    if (v9 == 0.0)
      v12 = 1;
    else
      v12 = -1;
    if (v9 != 0.0 || v10 != 0.0)
      goto LABEL_22;
  }
  else
  {
    v11 = v9 <= v10;
    if (v9 != v10)
      goto LABEL_13;
  }
  objc_msgSend(v6, "pommesL1Score");
  v14 = v13;
  objc_msgSend(v7, "pommesL1Score");
  if (v14 != 0.0 && v15 != 0.0)
  {
    v11 = v14 <= v15;
    if (v14 != v15)
    {
LABEL_13:
      if (v11)
        v12 = 1;
      else
        v12 = -1;
      goto LABEL_22;
    }
LABEL_21:
    objc_msgSend(v6, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v16, "compare:", v17);

    goto LABEL_22;
  }
  if (v14 == 0.0)
    v12 = 1;
  else
    v12 = -1;
  if (v14 == 0.0 && v15 == 0.0)
    goto LABEL_21;
LABEL_22:

  return v12;
}

- (int64_t)mailCompare:(id)a3 to:(id)a4 currentTime:(double)a5
{
  id v8;
  id v9;
  int64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  v10 = -[SSPommesRanker compare:to:currentTime:](self, "compare:to:currentTime:", v8, v9, a5);
  if (!v10)
  {
    objc_msgSend(v8, "mailDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    v13 = v12;

    objc_msgSend(v9, "mailDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    v16 = v15;

    if (v13 >= v16)
    {
      if (v13 <= v16)
      {
        objc_msgSend(v8, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v17, "compare:", v18);

      }
      else
      {
        v10 = -1;
      }
    }
    else
    {
      v10 = 1;
    }
  }

  return v10;
}

- (void)sortAndFilterRankedItems:(id)a3 maxCount:(int64_t)a4 bundleID:(id)a5 userQuery:(id)a6 queryID:(int64_t)a7 privateQuery:(BOOL)a8 currentTime:(double)a9
{
  _BOOL4 v10;
  id v15;
  id v16;
  id v17;
  void *v18;
  char IsMailOrPommesCTL;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  int v82;
  uint64_t v83;
  NSObject *v84;
  void *v85;
  void *v86;
  id obj;
  id v88;
  void *v89;
  uint64_t v91;
  NSObject *log;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _QWORD v101[6];
  char v102;
  uint8_t v103[128];
  uint8_t buf[4];
  id v105;
  __int16 v106;
  int64_t v107;
  __int16 v108;
  uint64_t v109;
  __int16 v110;
  uint64_t v111;
  __int16 v112;
  uint64_t v113;
  _BYTE v114[128];
  uint64_t v115;

  v10 = a8;
  v115 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a5;
  v17 = a6;
  if (SSSectionIsSyndicatedPhotos(v16))
  {
    +[SSPommesPhotosRanker sharedInstance](SSPommesPhotosRanker, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sortAndFilterRankedPhotosItems:maxCount:userQuery:currentTime:", v15, a4, v17, a9);

  }
  else
  {
    v89 = v17;
    IsMailOrPommesCTL = SSSectionIsMailOrPommesCTL(v16);
    v101[0] = MEMORY[0x1E0C809B0];
    v101[1] = 3221225472;
    v101[2] = __104__SSPommesRanker_sortAndFilterRankedItems_maxCount_bundleID_userQuery_queryID_privateQuery_currentTime___block_invoke;
    v101[3] = &unk_1E6E436C8;
    v102 = IsMailOrPommesCTL;
    v101[4] = self;
    *(double *)&v101[5] = a9;
    objc_msgSend(v15, "sortWithOptions:usingComparator:", 1, v101);
    v20 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v15;
    objc_msgSend(v15, "removeAllObjects");
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    obj = v20;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v114, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v98;
LABEL_5:
      v25 = 0;
      while (1)
      {
        if (*(_QWORD *)v98 != v24)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v25);
        if (objc_msgSend(v21, "count") >= (unint64_t)a4)
          break;
        objc_msgSend(v26, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v21, "containsObject:", v27);

        if ((v28 & 1) == 0)
        {
          objc_msgSend(v86, "addObject:", v26);
          objc_msgSend(v26, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v29);

        }
        if (v23 == ++v25)
        {
          v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v114, 16);
          if (v23)
            goto LABEL_5;
          break;
        }
      }
    }

    SSPommesRankerLog();
    log = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      v15 = v86;
      v17 = v89;
      if (v30)
      {
        v31 = objc_msgSend(obj, "count");
        v32 = objc_msgSend(v86, "count");
        *(_DWORD *)buf = 138413058;
        v105 = v16;
        v106 = 2048;
        v107 = a7;
        v108 = 2048;
        v109 = v31;
        v110 = 2048;
        v111 = v32;
        _os_log_impl(&dword_1B86C5000, log, OS_LOG_TYPE_DEFAULT, "[bundle=%@][qid=%lu] sorted and filtered %lu items. Final items count: %lu", buf, 0x2Au);
      }
    }
    else
    {
      if (v30)
      {
        SSRedactString(v89, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(obj, "count");
        v35 = objc_msgSend(v86, "count");
        *(_DWORD *)buf = 138413314;
        v105 = v16;
        v106 = 2048;
        v107 = a7;
        v108 = 2112;
        v109 = (uint64_t)v33;
        v110 = 2048;
        v111 = v34;
        v112 = 2048;
        v113 = v35;
        _os_log_impl(&dword_1B86C5000, log, OS_LOG_TYPE_DEFAULT, "[bundle=%@][qid=%lu][query=\"%@\"] sorted and filtered %lu items. Final items count: %lu", buf, 0x34u);

      }
      v95 = 0u;
      v96 = 0u;
      v93 = 0u;
      v94 = 0u;
      log = obj;
      v36 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v94;
        v88 = v16;
        do
        {
          v39 = 0;
          v91 = v37;
          do
          {
            if (*(_QWORD *)v94 != v38)
              objc_enumerationMutation(log);
            v40 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v39);
            objc_msgSend(v40, "identifier");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "length");

            if (v42)
            {
              v43 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v40, "description");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "stringWithFormat:", CFSTR("%@"), v44);
              v45 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v40, "rankingItem");
              v46 = objc_claimAutoreleasedReturnValue();
              if (v46)
              {
                v47 = (void *)v46;
                v48 = v21;
                objc_msgSend(v40, "rankingItem");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "l2Features");
                v50 = (void *)objc_claimAutoreleasedReturnValue();

                if (v50)
                {
                  objc_msgSend(v40, "rankingItem");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "l2Features");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "objectForKey:", CFSTR("embSim"));
                  v53 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v53)
                  {
                    v54 = (void *)MEMORY[0x1E0CB3940];
                    objc_msgSend(v40, "rankingItem");
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v55, "l2Features");
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("embSim"));
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v57, "doubleValue");
                    objc_msgSend(v54, "stringWithFormat:", CFSTR(", embSim = %.04f"), v58);
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "stringByAppendingString:", v59);
                    v60 = objc_claimAutoreleasedReturnValue();

                    v45 = (void *)v60;
                  }
                  objc_msgSend(v40, "rankingItem");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v61, "l2Features");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v62, "objectForKey:", CFSTR("freshness"));
                  v63 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v63)
                  {
                    v64 = (void *)MEMORY[0x1E0CB3940];
                    objc_msgSend(v40, "rankingItem");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v65, "l2Features");
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("freshness"));
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v67, "doubleValue");
                    objc_msgSend(v64, "stringWithFormat:", CFSTR(", freshness = %.04f"), v68);
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "stringByAppendingString:", v69);
                    v70 = objc_claimAutoreleasedReturnValue();

                    v45 = (void *)v70;
                  }
                  objc_msgSend(v40, "rankingItem");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v71, "l2Features");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v72, "objectForKey:", CFSTR("engagement"));
                  v73 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v73)
                  {
                    v74 = (void *)MEMORY[0x1E0CB3940];
                    objc_msgSend(v40, "rankingItem");
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v75, "l2Features");
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("engagement"));
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v77, "doubleValue");
                    objc_msgSend(v74, "stringWithFormat:", CFSTR(", engagement = %.04f"), v78);
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "stringByAppendingString:", v79);
                    v80 = objc_claimAutoreleasedReturnValue();

                    v45 = (void *)v80;
                  }
                  v16 = v88;
                }
                v21 = v48;
                v37 = v91;
              }
              objc_msgSend(v40, "identifier");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              v82 = objc_msgSend(v21, "containsObject:", v81);

              if (v82)
              {
                objc_msgSend(v45, "stringByAppendingString:", CFSTR(" (TH)"));
                v83 = objc_claimAutoreleasedReturnValue();

                v45 = (void *)v83;
              }
              SSPommesRankerLog();
              v84 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
              {
                SSRedactString(v89, 0);
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413058;
                v105 = v16;
                v106 = 2048;
                v107 = a7;
                v108 = 2112;
                v109 = (uint64_t)v85;
                v110 = 2112;
                v111 = (uint64_t)v45;
                _os_log_impl(&dword_1B86C5000, v84, OS_LOG_TYPE_DEFAULT, "[bundle=%@][qid=%lu][query=\"%@\"] %@", buf, 0x2Au);

              }
            }
            ++v39;
          }
          while (v37 != v39);
          v37 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
        }
        while (v37);
      }
      v15 = v86;
      v17 = v89;
    }

  }
}

uint64_t __104__SSPommesRanker_sortAndFilterRankedItems_maxCount_bundleID_userQuery_queryID_privateQuery_currentTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(unsigned __int8 *)(a1 + 48);
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(a2, "rankingItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rankingItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(double *)(a1 + 40);
  if (v5)
    v11 = objc_msgSend(v6, "mailCompare:to:currentTime:", v8, v9, v10);
  else
    v11 = objc_msgSend(v6, "compare:to:currentTime:", v8, v9, v10);
  v12 = v11;

  return v12;
}

- (float)estimatedMaxPommesL1Score
{
  return self->_estimatedMaxPommesL1Score;
}

- (void)setEstimatedMaxPommesL1Score:(float)a3
{
  self->_estimatedMaxPommesL1Score = a3;
}

@end
