@implementation SREMusicMetadataRetrieval

- (id)retrieveMusicMetadata:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  void *v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  uint8_t v85[4];
  uint64_t v86;
  _BYTE v87[128];
  uint8_t v88[128];
  uint8_t buf[4];
  uint64_t v90;
  __int16 v91;
  uint64_t v92;
  _QWORD v93[4];

  v93[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v68 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v5, "count"));
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v7;
  v71 = (void *)v6;
  if (objc_msgSend(v5, "count"))
  {
    v8 = 0;
    do
    {
      v9 = objc_alloc(MEMORY[0x24BE584F8]);
      objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
      v10 = v5;
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v8 + 1;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("adamId_%lu"), v8 + 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v9, "initWithValue:arg:", v12, v14);

      v7 = v70;
      v5 = v10;
      v6 = (uint64_t)v71;
      objc_msgSend(v71, "addObject:", v15);
      v16 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("-a adamId_%lu=%@"), v13, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v70, "addObject:", v18);
      v8 = v13;
    }
    while (v13 < objc_msgSend(v5, "count"));
  }
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE58508]), "initWithIntent:args:score:", CFSTR("MusicEntitySearch"), v6, &unk_251907DC0);
  v20 = objc_alloc(MEMORY[0x24BE58510]);
  v93[0] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v93, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 10 * objc_msgSend(v5, "count"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v20, "initWithIntents:query:limit:offset:", v21, &stru_251905500, v22, &unk_251907DC0);

  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" "));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  logForCSLogCategoryRecs();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v90 = (uint64_t)v24;
    _os_log_impl(&dword_247974000, v25, OS_LOG_TYPE_DEFAULT, "Starting knosis service call: %@", buf, 0xCu);
  }

  objc_msgSend(v68, "executeIntent:error:", v23, a4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  logForCSLogCategoryRecs();
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v26)
  {
    v63 = v24;
    v64 = v23;
    v65 = v19;
    v67 = v5;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v29 = objc_msgSend(v26, "status");
      objc_msgSend(v26, "answers");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "count");
      *(_DWORD *)buf = 134218240;
      v90 = v29;
      v91 = 2048;
      v92 = v31;
      _os_log_impl(&dword_247974000, v28, OS_LOG_TYPE_DEFAULT, "Parsing Knosis response. status=%ld answers.count = %ld", buf, 0x16u);

    }
    v32 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend(v26, "answers");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "dictionaryWithCapacity:", objc_msgSend(v33, "count"));
    v28 = objc_claimAutoreleasedReturnValue();

    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v66 = v26;
    objc_msgSend(v26, "answers");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v81;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v81 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
          objc_msgSend(v39, "answerId");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKey:](v28, "setObject:forKey:", v39, v40);

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
      }
      while (v36);
    }

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v67, "count"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    objc_msgSend(v66, "answers");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v77;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v77 != v45)
            objc_enumerationMutation(v42);
          -[SREMusicMetadataRetrieval parseAnswer:withAllAnswers:](self, "parseAnswer:withAllAnswers:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * j), v28);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v47;
          if (v47)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v47, "trackId"));
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "setObject:forKey:", v48, v49);

            logForCSLogCategoryRecs();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
              -[SREMusicMetadataRetrieval retrieveMusicMetadata:error:].cold.2(v85, v48, &v86, v50);

          }
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
      }
      while (v44);
    }

    v5 = v67;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v67, "count"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v52 = v67;
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v73;
      do
      {
        for (k = 0; k != v54; ++k)
        {
          if (*(_QWORD *)v73 != v55)
            objc_enumerationMutation(v52);
          objc_msgSend(v41, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * k));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          if (v57)
            objc_msgSend(v51, "addObject:", v57);

        }
        v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
      }
      while (v54);
    }

    logForCSLogCategoryRecs();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v59 = objc_msgSend(v51, "count");
      v60 = objc_msgSend(v52, "count");
      *(_DWORD *)buf = 134218240;
      v90 = v59;
      v91 = 2048;
      v92 = v60;
      _os_log_impl(&dword_247974000, v58, OS_LOG_TYPE_DEFAULT, "End Knosis response parse. Got %ld/%ld music candidates with metadata.", buf, 0x16u);
    }

    v61 = v71;
    v23 = v64;
    v19 = v65;
    v24 = v63;
    v26 = v66;
  }
  else
  {
    v61 = v71;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[SREMusicMetadataRetrieval retrieveMusicMetadata:error:].cold.1((uint64_t *)a4, v28);
    v51 = 0;
  }

  return v51;
}

- (id)parseAnswer:(id)a3 withAllAnswers:(id)a4
{
  id v5;
  SREMusicCandidate *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  SREMusicMetadataRetrieval *v29;
  void *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  char v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  int v45;
  void *v46;
  int v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  int v62;
  uint64_t v63;
  SREMusicCandidate *v64;
  void *v66;
  id v68;
  id obj;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  id v76;
  int v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[5];
  uint8_t v100[128];
  uint8_t buf[4];
  void *v102;
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v68 = a4;
  v6 = objc_alloc_init(SREMusicCandidate);
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v66 = v5;
  objc_msgSend(v5, "parents");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
  if (v71)
  {
    v70 = *(_QWORD *)v96;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v96 != v70)
          objc_enumerationMutation(obj);
        v72 = v7;
        v8 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v7);
        v91 = 0u;
        v92 = 0u;
        v93 = 0u;
        v94 = 0u;
        objc_msgSend(v8, "facts");
        v76 = (id)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v92;
          v73 = *(_QWORD *)v92;
          do
          {
            v12 = 0;
            v74 = v10;
            do
            {
              if (*(_QWORD *)v92 != v11)
                objc_enumerationMutation(v76);
              v13 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v12);
              objc_msgSend(v13, "predicateId");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("PS72"));

              if (v15)
              {
                v89 = 0u;
                v90 = 0u;
                v87 = 0u;
                v88 = 0u;
                objc_msgSend(v13, "qualifiers");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v87, v103, 16);
                if (v17)
                {
                  v18 = v17;
                  v19 = *(_QWORD *)v88;
                  do
                  {
                    for (i = 0; i != v18; ++i)
                    {
                      if (*(_QWORD *)v88 != v19)
                        objc_enumerationMutation(v16);
                      v21 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
                      objc_msgSend(v21, "predicateId");
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("PS69"));

                      if (v23)
                      {
                        objc_msgSend(v21, "objectID");
                        v24 = (void *)objc_claimAutoreleasedReturnValue();
                        -[SREMusicCandidate setTrackId:](v6, "setTrackId:", objc_msgSend(v24, "integerValue"));

                        if (-[SREMusicCandidate trackId](v6, "trackId") > 0)
                          goto LABEL_24;
                        logForCSLogCategoryRecs();
                        v25 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                        {
                          objc_msgSend(v21, "objectID");
                          v26 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138412290;
                          v102 = v26;
                          _os_log_impl(&dword_247974000, v25, OS_LOG_TYPE_DEFAULT, "*warn* Failed to convert adam ID to a positive integer:%@", buf, 0xCu);

                        }
                      }
                    }
                    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v87, v103, 16);
                  }
                  while (v18);
                }
LABEL_24:

                v11 = v73;
                v10 = v74;
              }
              ++v12;
            }
            while (v12 != v10);
            v10 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
          }
          while (v10);
        }

        v7 = v72 + 1;
      }
      while (v72 + 1 != v71);
      v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
    }
    while (v71);
  }

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  objc_msgSend(v66, "facts");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
  v29 = self;
  v30 = v68;
  if (!v28)
  {
LABEL_69:

LABEL_70:
    v64 = 0;
    goto LABEL_71;
  }
  v31 = v28;
  v32 = 0;
  v78 = *(_QWORD *)v84;
  v75 = v27;
  do
  {
    v33 = 0;
    do
    {
      if (*(_QWORD *)v84 != v78)
        objc_enumerationMutation(v27);
      v34 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v33);
      objc_msgSend(v34, "predicateId");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("PS1"));

      if (v36)
      {
        objc_msgSend(v34, "objectID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("SB44"));

        if ((v38 & 1) == 0)
          goto LABEL_69;
        v32 = 1;
      }
      else
      {
        objc_msgSend(v34, "predicateId");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("PS33"));

        if (v40)
        {
          objc_msgSend(v34, "objectID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[SREMusicCandidate setTrackName:](v6, "setTrackName:", v41);
LABEL_43:

          goto LABEL_44;
        }
        objc_msgSend(v34, "predicateId");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("PS137"));

        if (v43)
        {
          -[SREMusicMetadataRetrieval extractArtistMetadataFromFact:withAllAnswers:toCandidate:](v29, "extractArtistMetadataFromFact:withAllAnswers:toCandidate:", v34, v30, v6);
          goto LABEL_44;
        }
        objc_msgSend(v34, "predicateId");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "isEqualToString:", CFSTR("PS486"));

        if (v45)
        {
          objc_msgSend(v34, "objectID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[SREMusicCandidate setArtworkURL:](v6, "setArtworkURL:", v41);
          goto LABEL_43;
        }
        v77 = v32;
        objc_msgSend(v34, "predicateId");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "isEqualToString:", CFSTR("PS106"));

        if (v47)
        {
          v81 = 0u;
          v82 = 0u;
          v79 = 0u;
          v80 = 0u;
          objc_msgSend(v34, "qualifiers");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v79, v99, 16);
          if (v49)
          {
            v50 = v49;
            v51 = *(_QWORD *)v80;
            while (2)
            {
              for (j = 0; j != v50; ++j)
              {
                if (*(_QWORD *)v80 != v51)
                  objc_enumerationMutation(v48);
                v53 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * j);
                objc_msgSend(v53, "predicateId");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v55 = objc_msgSend(v54, "isEqualToString:", CFSTR("PS3"));

                if (v55)
                {
                  objc_msgSend(v53, "objectID");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SREMusicCandidate setTrackTimeMillis:](v6, "setTrackTimeMillis:", objc_msgSend(v58, "integerValue"));

                  goto LABEL_59;
                }
              }
              v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v79, v99, 16);
              if (v50)
                continue;
              break;
            }
          }
LABEL_59:

          v29 = self;
          v30 = v68;
          v27 = v75;
        }
        else
        {
          objc_msgSend(v34, "predicateId");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v56, "isEqualToString:", CFSTR("PS123"));

          if (v57)
          {
            -[SREMusicMetadataRetrieval extractAlbumMetadataFromFact:withAllAnswers:toCandidate:](v29, "extractAlbumMetadataFromFact:withAllAnswers:toCandidate:", v34, v30, v6);
          }
          else
          {
            objc_msgSend(v34, "predicateId");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v59, "isEqualToString:", CFSTR("PS358"));

            if (v60)
            {
              -[SREMusicCandidate setTrackExplicitness:](v6, "setTrackExplicitness:", 1);
            }
            else
            {
              objc_msgSend(v34, "predicateId");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = objc_msgSend(v61, "isEqualToString:", CFSTR("PS10"));

              if (v62)
                -[SREMusicMetadataRetrieval extractGenreMetadataFromFact:withAllAnswers:toCandidate:](v29, "extractGenreMetadataFromFact:withAllAnswers:toCandidate:", v34, v30, v6);
            }
          }
        }
        v32 = v77;
      }
LABEL_44:
      ++v33;
    }
    while (v33 != v31);
    v63 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
    v31 = v63;
  }
  while (v63);

  if (!v32 || -[SREMusicCandidate trackId](v6, "trackId") < 1)
    goto LABEL_70;
  v64 = v6;
LABEL_71:

  return v64;
}

- (void)extractArtistMetadataFromFact:(id)a3 withAllAnswers:(id)a4 toCandidate:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  NSObject *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v32 = a4;
  v8 = a5;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v7, "qualifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v38;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v13);
      objc_msgSend(v14, "predicateId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("PS16"));

      if ((v16 & 1) != 0)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    objc_msgSend(v14, "objectID");
    v17 = objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_22;
    objc_msgSend(v32, "objectForKey:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v30 = v18;
      v31 = v8;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      objc_msgSend(v18, "facts");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v34;
        while (2)
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v34 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v25, "predicateId");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("PS33"));

            if (v27)
            {
              objc_msgSend(v25, "objectID");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v8 = v31;
              objc_msgSend(v31, "setArtistName:", v29);

              goto LABEL_25;
            }
          }
          v22 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (v22)
            continue;
          break;
        }
      }

      logForCSLogCategoryRecs();
      v20 = objc_claimAutoreleasedReturnValue();
      v8 = v31;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v17;
        _os_log_impl(&dword_247974000, v20, OS_LOG_TYPE_DEFAULT, "*warn* Performer name not found. Performer md=%@", buf, 0xCu);
      }
LABEL_25:
      v19 = v30;
    }
    else
    {
      logForCSLogCategoryRecs();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v17;
        _os_log_impl(&dword_247974000, v20, OS_LOG_TYPE_DEFAULT, "*warn* Performer answer not found. Performer md=%@", buf, 0xCu);
      }
    }

  }
  else
  {
LABEL_9:

LABEL_22:
    logForCSLogCategoryRecs();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "objectID");
      v28 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v43 = v28;
      _os_log_impl(&dword_247974000, v17, OS_LOG_TYPE_DEFAULT, "*warn* Performer MD not found. Performer fact=%@", buf, 0xCu);

    }
  }

}

- (void)extractAlbumMetadataFromFact:(id)a3 withAllAnswers:(id)a4 toCandidate:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  id v54;
  NSObject *obj;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint8_t v85[128];
  uint8_t buf[4];
  NSObject *v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v54 = a4;
  v8 = a5;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v53 = v7;
  objc_msgSend(v7, "qualifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v79;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v79 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v13);
      objc_msgSend(v14, "predicateId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("PS53"));

      if ((v16 & 1) != 0)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    objc_msgSend(v14, "objectID");
    v17 = objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_50;
    objc_msgSend(v54, "objectForKey:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v51 = v17;
      v52 = v18;
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      -[NSObject facts](v18, "facts");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v75;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v75 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
            objc_msgSend(v25, "predicateId");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("PS33"));

            if (v27)
            {
              objc_msgSend(v25, "objectID");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setCollectionName:", v28);

            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
        }
        while (v22);
      }

      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v19 = v52;
      -[NSObject parents](v52, "parents");
      v29 = objc_claimAutoreleasedReturnValue();
      v57 = -[NSObject countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
      if (v57)
      {
        obj = v29;
        v56 = *(_QWORD *)v71;
        do
        {
          v30 = 0;
          do
          {
            if (*(_QWORD *)v71 != v56)
              objc_enumerationMutation(obj);
            v58 = v30;
            v31 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v30);
            v66 = 0u;
            v67 = 0u;
            v68 = 0u;
            v69 = 0u;
            objc_msgSend(v31, "facts");
            v61 = (id)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v66, v83, 16);
            if (v32)
            {
              v33 = v32;
              v34 = *(_QWORD *)v67;
              v59 = *(_QWORD *)v67;
              do
              {
                v35 = 0;
                v60 = v33;
                do
                {
                  if (*(_QWORD *)v67 != v34)
                    objc_enumerationMutation(v61);
                  v36 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v35);
                  objc_msgSend(v36, "predicateId");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("PS72"));

                  if (v38)
                  {
                    v64 = 0u;
                    v65 = 0u;
                    v62 = 0u;
                    v63 = 0u;
                    objc_msgSend(v36, "qualifiers");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
                    if (v40)
                    {
                      v41 = v40;
                      v42 = *(_QWORD *)v63;
                      do
                      {
                        for (j = 0; j != v41; ++j)
                        {
                          if (*(_QWORD *)v63 != v42)
                            objc_enumerationMutation(v39);
                          v44 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
                          objc_msgSend(v44, "predicateId");
                          v45 = (void *)objc_claimAutoreleasedReturnValue();
                          v46 = objc_msgSend(v45, "isEqualToString:", CFSTR("PS69"));

                          if (v46)
                          {
                            objc_msgSend(v44, "objectID");
                            v47 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v8, "setCollectionId:", objc_msgSend(v47, "integerValue"));

                            if (objc_msgSend(v8, "collectionId") > 0)
                              goto LABEL_44;
                            logForCSLogCategoryRecs();
                            v48 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                            {
                              objc_msgSend(v44, "objectID");
                              v49 = objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)buf = 138412290;
                              v87 = v49;
                              _os_log_impl(&dword_247974000, v48, OS_LOG_TYPE_DEFAULT, "*warn* Failed to convert adam ID to integer:%@", buf, 0xCu);

                            }
                          }
                        }
                        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
                      }
                      while (v41);
                    }
LABEL_44:

                    v34 = v59;
                    v33 = v60;
                  }
                  ++v35;
                }
                while (v35 != v33);
                v33 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v66, v83, 16);
              }
              while (v33);
            }

            v30 = v58 + 1;
          }
          while (v58 + 1 != v57);
          v57 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
        }
        while (v57);
        v19 = v52;
        v50 = v53;
        v17 = v51;
        v29 = obj;
      }
      else
      {
        v50 = v53;
        v17 = v51;
      }
    }
    else
    {
      logForCSLogCategoryRecs();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v87 = v17;
        _os_log_impl(&dword_247974000, v29, OS_LOG_TYPE_DEFAULT, "*warn* Album answer not found. Album md=%@", buf, 0xCu);
      }
      v50 = v53;
    }

    goto LABEL_57;
  }
LABEL_9:

LABEL_50:
  logForCSLogCategoryRecs();
  v17 = objc_claimAutoreleasedReturnValue();
  v50 = v53;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v53, "objectID");
    v19 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v87 = v19;
    _os_log_impl(&dword_247974000, v17, OS_LOG_TYPE_DEFAULT, "*warn* Album MD not found. Album fact=%@", buf, 0xCu);
LABEL_57:

  }
}

- (void)extractGenreMetadataFromFact:(id)a3 withAllAnswers:(id)a4 toCandidate:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  const char *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  void *v34;
  uint8_t v35[128];
  uint8_t buf[4];
  NSObject *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "objectID");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "objectForKey:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v27 = v9;
      v28 = v8;
      v29 = v7;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      -[NSObject facts](v11, "facts");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v31;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v31 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            objc_msgSend(v18, "predicateId");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("PS33"));

            if (v20)
            {
              v9 = v27;
              objc_msgSend(v27, "genreIDs");
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (v23)
              {
                objc_msgSend(v27, "genreIDs");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "objectID");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "arrayByAddingObject:", v25);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setGenreIDs:", v26);

              }
              else
              {
                objc_msgSend(v18, "objectID");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = v24;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setGenreIDs:", v25);
              }
              v8 = v28;
              v7 = v29;

              goto LABEL_23;
            }
          }
          v15 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
          if (v15)
            continue;
          break;
        }
      }

      logForCSLogCategoryRecs();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v10;
        _os_log_impl(&dword_247974000, v13, OS_LOG_TYPE_DEFAULT, "*warn* Genre name not found. Genre md=%@", buf, 0xCu);
      }
      v8 = v28;
      v7 = v29;
      v9 = v27;
      goto LABEL_23;
    }
    logForCSLogCategoryRecs();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
LABEL_23:

      goto LABEL_24;
    }
    *(_DWORD *)buf = 138412290;
    v37 = v10;
    v21 = "*warn* Genre answer not found. Genre md=%@";
    v22 = v13;
LABEL_20:
    _os_log_impl(&dword_247974000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
    goto LABEL_23;
  }
  logForCSLogCategoryRecs();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "objectID");
    v13 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v37 = v13;
    v21 = "*warn* Genre MD not found. Genre fact=%@";
    v22 = v12;
    goto LABEL_20;
  }
LABEL_24:

}

- (void)retrieveMusicMetadata:(uint64_t *)a1 error:(NSObject *)a2 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_247974000, a2, OS_LOG_TYPE_ERROR, "GDXPCKnosisService execution failed. error=%@", (uint8_t *)&v3, 0xCu);
}

- (void)retrieveMusicMetadata:(_QWORD *)a3 error:(NSObject *)a4 .cold.2(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "debugString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_247974000, a4, OS_LOG_TYPE_DEBUG, "Metadata parsed for candidate: %@", a1, 0xCu);

}

@end
