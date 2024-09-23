@implementation PGRecentPersonCentricSuggester

+ (NSIndexSet)suggestionTypes
{
  return (NSIndexSet *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 3);
}

+ (NSIndexSet)suggestionSubtypes
{
  return (NSIndexSet *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 304);
}

- (void)startSuggestingWithOptions:(id)a3
{
  PGSuggestionOptions *v4;
  void *v5;
  NSObject *v6;
  NSDictionary *assetsByPersonLocalIdentifier;
  NSArray *birthdayPersonPotentialSuggestions;
  NSArray *longTimeNoSeePersonPotentialSuggestions;
  NSArray *personPotentialSuggestions;
  NSEnumerator *birthdayPersonPotentialSuggestionEnumerator;
  NSEnumerator *longTimeNoSeePersonPotentialSuggestionEnumerator;
  NSEnumerator *personPotentialSuggestionEnumerator;
  NSMutableSet *v14;
  NSMutableSet *usedPersonLocalIdentifiers;
  void *v16;
  PGSuggestionOptions *options;
  PGSuggestionOptions *v18;
  _QWORD v19[5];
  uint8_t buf[16];

  v4 = (PGSuggestionOptions *)a3;
  -[PGAbstractSuggester session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loggingConnection");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_DEFAULT, "Recent Person Centric: Starting suggesting", buf, 2u);
  }

  assetsByPersonLocalIdentifier = self->_assetsByPersonLocalIdentifier;
  self->_assetsByPersonLocalIdentifier = 0;

  birthdayPersonPotentialSuggestions = self->_birthdayPersonPotentialSuggestions;
  self->_birthdayPersonPotentialSuggestions = 0;

  longTimeNoSeePersonPotentialSuggestions = self->_longTimeNoSeePersonPotentialSuggestions;
  self->_longTimeNoSeePersonPotentialSuggestions = 0;

  personPotentialSuggestions = self->_personPotentialSuggestions;
  self->_personPotentialSuggestions = 0;

  birthdayPersonPotentialSuggestionEnumerator = self->_birthdayPersonPotentialSuggestionEnumerator;
  self->_birthdayPersonPotentialSuggestionEnumerator = 0;

  longTimeNoSeePersonPotentialSuggestionEnumerator = self->_longTimeNoSeePersonPotentialSuggestionEnumerator;
  self->_longTimeNoSeePersonPotentialSuggestionEnumerator = 0;

  personPotentialSuggestionEnumerator = self->_personPotentialSuggestionEnumerator;
  self->_personPotentialSuggestionEnumerator = 0;

  v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  usedPersonLocalIdentifiers = self->_usedPersonLocalIdentifiers;
  self->_usedPersonLocalIdentifiers = v14;

  objc_msgSend(v5, "workingContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __61__PGRecentPersonCentricSuggester_startSuggestingWithOptions___block_invoke;
  v19[3] = &unk_1E84353C0;
  v19[4] = self;
  objc_msgSend(v16, "performSynchronousConcurrentGraphReadUsingBlock:", v19);

  options = self->_options;
  self->_options = v4;
  v18 = v4;

}

- (id)nextPotentialSuggestionWithProgress:(id)a3
{
  id v4;
  void *v5;
  double v6;
  char v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  double Current;
  char v15;
  double v16;
  char v17;
  double v18;
  char v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  double *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint8_t buf[4];
  int v45;
  __int16 v46;
  const char *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _Block_copy(v4);
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v36 = 0;
  v37 = (double *)&v36;
  v38 = 0x2020000000;
  v39 = 0;
  if (!v5
    || (v6 = CFAbsoluteTimeGetCurrent(), v6 - v37[3] < 0.01)
    || (v37[3] = v6,
        v35 = 0,
        (*((void (**)(void *, char *, double))v5 + 2))(v5, &v35, 0.0),
        v7 = *((_BYTE *)v41 + 24) | v35,
        (*((_BYTE *)v41 + 24) = v7) == 0))
  {
    v9 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __70__PGRecentPersonCentricSuggester_nextPotentialSuggestionWithProgress___block_invoke;
    v30[3] = &unk_1E8434F30;
    v10 = v5;
    v31 = v10;
    v32 = &v36;
    v33 = &v40;
    v34 = 0x3F847AE147AE147BLL;
    -[PGRecentPersonCentricSuggester nextBirthdayPersonPotentialSuggestionWithProgress:](self, "nextBirthdayPersonPotentialSuggestionWithProgress:", v30);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v41 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v45 = 112;
        v46 = 2080;
        v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
        v12 = MEMORY[0x1E0C81028];
LABEL_10:
        _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if (v5)
      {
        Current = CFAbsoluteTimeGetCurrent();
        if (Current - v37[3] >= 0.01)
        {
          v37[3] = Current;
          v35 = 0;
          (*((void (**)(id, char *, double))v10 + 2))(v10, &v35, 0.33);
          v15 = *((_BYTE *)v41 + 24) | v35;
          *((_BYTE *)v41 + 24) = v15;
          if (v15)
          {
            if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              goto LABEL_11;
            *(_DWORD *)buf = 67109378;
            v45 = 114;
            v46 = 2080;
            v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
            v12 = MEMORY[0x1E0C81028];
            goto LABEL_10;
          }
        }
      }
      if (!v11)
      {
        v25[0] = v9;
        v25[1] = 3221225472;
        v25[2] = __70__PGRecentPersonCentricSuggester_nextPotentialSuggestionWithProgress___block_invoke_155;
        v25[3] = &unk_1E8434F30;
        v26 = v10;
        v27 = &v36;
        v28 = &v40;
        v29 = 0x3F847AE147AE147BLL;
        -[PGRecentPersonCentricSuggester nextLongTimeNoSeePersonPotentialSuggestionWithProgress:](self, "nextLongTimeNoSeePersonPotentialSuggestionWithProgress:", v25);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if (*((_BYTE *)v41 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v45 = 120;
            v46 = 2080;
            v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          goto LABEL_11;
        }

      }
      if (v5)
      {
        v16 = CFAbsoluteTimeGetCurrent();
        if (v16 - v37[3] >= 0.01)
        {
          v37[3] = v16;
          v35 = 0;
          (*((void (**)(id, char *, double))v10 + 2))(v10, &v35, 0.66);
          v17 = *((_BYTE *)v41 + 24) | v35;
          *((_BYTE *)v41 + 24) = v17;
          if (v17)
          {
            if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              goto LABEL_11;
            *(_DWORD *)buf = 67109378;
            v45 = 123;
            v46 = 2080;
            v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
            v12 = MEMORY[0x1E0C81028];
            goto LABEL_10;
          }
        }
      }
      if (!v11)
      {
        v20[0] = v9;
        v20[1] = 3221225472;
        v20[2] = __70__PGRecentPersonCentricSuggester_nextPotentialSuggestionWithProgress___block_invoke_156;
        v20[3] = &unk_1E8434F30;
        v21 = v10;
        v22 = &v36;
        v23 = &v40;
        v24 = 0x3F847AE147AE147BLL;
        -[PGRecentPersonCentricSuggester nextPersonPotentialSuggestionWithProgress:](self, "nextPersonPotentialSuggestionWithProgress:", v20);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if (*((_BYTE *)v41 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v45 = 130;
            v46 = 2080;
            v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          goto LABEL_11;
        }

      }
      if (!v5
        || (v18 = CFAbsoluteTimeGetCurrent(), v18 - v37[3] < 0.01)
        || (v37[3] = v18,
            v35 = 0,
            (*((void (**)(id, char *, double))v10 + 2))(v10, &v35, 1.0),
            v19 = *((_BYTE *)v41 + 24) | v35,
            (*((_BYTE *)v41 + 24) = v19) == 0))
      {
        v11 = v11;
        v8 = v11;
        goto LABEL_12;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v45 = 133;
        v46 = 2080;
        v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
        v12 = MEMORY[0x1E0C81028];
        goto LABEL_10;
      }
    }
LABEL_11:
    v8 = 0;
LABEL_12:

    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v45 = 107;
    v46 = 2080;
    v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestions/"
          "Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v8 = 0;
LABEL_13:
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  return v8;
}

- (id)suggestionWithPotentialSuggestion:(id)a3 progress:(id)a4
{
  id v6;
  id v7;
  void (**v8)(void *, _QWORD *, double);
  double v9;
  char v10;
  PGPeopleCentricSuggestion *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double Current;
  char v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  double v24;
  void (**v25)(void *, _QWORD *, double);
  id v26;
  NSObject *v27;
  double v28;
  char v29;
  void *v30;
  PGPeopleCentricSuggestion *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  char v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  os_log_t oslog;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  _QWORD v54[4];
  id v55;
  id v56;
  uint64_t *v57;
  _QWORD *v58;
  uint64_t *v59;
  _QWORD *v60;
  uint64_t *v61;
  uint64_t *p_buf;
  uint64_t v63;
  double v64;
  _QWORD v65[4];
  uint64_t v66;
  double *v67;
  uint64_t v68;
  unint64_t v69;
  _QWORD v70[4];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  double *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  char v82;
  void *v83;
  int v84;
  int v85;
  __int16 v86;
  const char *v87;
  uint64_t buf;
  __int128 v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(void *, _QWORD *, double))_Block_copy(v7);
  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = 0;
  v75 = 0;
  v76 = (double *)&v75;
  v77 = 0x2020000000;
  v78 = 0;
  v49 = v7;
  v50 = v6;
  if (!v8
    || (v9 = CFAbsoluteTimeGetCurrent(), v9 - v76[3] < 0.01)
    || (v76[3] = v9,
        LOBYTE(v70[0]) = 0,
        v8[2](v8, v70, 0.0),
        v10 = *((_BYTE *)v80 + 24) | LOBYTE(v70[0]),
        (*((_BYTE *)v80 + 24) = v10) == 0))
  {
    -[PGAbstractSuggester session](self, "session");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingConnection");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "personLocalIdentifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assets");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesGroupedByAssetLocalIdentifierForAssets:options:", v14, 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v12;
    oslog = (os_log_t)v13;
    if (v8)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v76[3] >= 0.01)
      {
        v76[3] = Current;
        LOBYTE(v70[0]) = 0;
        v8[2](v8, v70, 0.2);
        v16 = *((_BYTE *)v80 + 24) | LOBYTE(v70[0]);
        *((_BYTE *)v80 + 24) = v16;
        if (v16)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            buf = 0x9704000202;
            LOWORD(v89) = 2080;
            *(_QWORD *)((char *)&v89 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecent"
                                            "PersonCentricSuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
          }
          v11 = 0;
          goto LABEL_49;
        }
      }
    }
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v14, "count"));
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v18 = v14;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v71, v93, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v72 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
          objc_msgSend(v22, "localIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, v23);

        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v71, v93, 16);
      }
      while (v19);
    }

    buf = 0;
    *(_QWORD *)&v89 = &buf;
    *((_QWORD *)&v89 + 1) = 0x3032000000;
    v90 = __Block_byref_object_copy__31144;
    v91 = __Block_byref_object_dispose__31145;
    v92 = 0;
    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x2020000000;
    v70[3] = 0xFFEFFFFFFFFFFFFFLL;
    v66 = 0;
    v67 = (double *)&v66;
    v68 = 0x2020000000;
    v69 = 0xFFEFFFFFFFFFFFFFLL;
    v65[0] = 0;
    v65[1] = v65;
    v65[2] = 0x2020000000;
    v65[3] = 0;
    v24 = 1.0 / (double)(unint64_t)objc_msgSend(v52, "count");
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __77__PGRecentPersonCentricSuggester_suggestionWithPotentialSuggestion_progress___block_invoke;
    v54[3] = &unk_1E842CDE8;
    v25 = v8;
    v56 = v25;
    v57 = &v75;
    v63 = 0x3F847AE147AE147BLL;
    v58 = v65;
    v59 = &v79;
    v64 = v24;
    v26 = v51;
    v55 = v26;
    v60 = v70;
    v61 = &v66;
    p_buf = &buf;
    objc_msgSend(v52, "enumerateKeysAndObjectsUsingBlock:", v54);
    if (*((_BYTE *)v80 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_24:
        v11 = 0;
LABEL_48:

        _Block_object_dispose(v65, 8);
        _Block_object_dispose(&v66, 8);
        _Block_object_dispose(v70, 8);
        _Block_object_dispose(&buf, 8);

LABEL_49:
        goto LABEL_50;
      }
      v84 = 67109378;
      v85 = 183;
      v86 = 2080;
      v87 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestion"
            "s/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
      v27 = MEMORY[0x1E0C81028];
LABEL_23:
      _os_log_impl(&dword_1CA237000, v27, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v84, 0x12u);
      goto LABEL_24;
    }
    if (v8)
    {
      v28 = CFAbsoluteTimeGetCurrent();
      if (v28 - v76[3] >= 0.01)
      {
        v76[3] = v28;
        v53 = 0;
        ((void (**)(void *, char *, double))v25)[2](v25, &v53, 0.8);
        v29 = *((_BYTE *)v80 + 24) | v53;
        *((_BYTE *)v80 + 24) = v29;
        if (v29)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            goto LABEL_24;
          v84 = 67109378;
          v85 = 185;
          v86 = 2080;
          v87 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
          v27 = MEMORY[0x1E0C81028];
          goto LABEL_23;
        }
      }
    }
    if (v67[3] >= 0.15
      && (objc_msgSend(v17, "objectForKeyedSubscript:", *(_QWORD *)(v89 + 40)),
          (v30 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v31 = -[PGPeopleCentricSuggestion initWithPersonLocalIdentifier:asset:]([PGPeopleCentricSuggestion alloc], "initWithPersonLocalIdentifier:asset:", v26, v30);
      objc_msgSend(v47, "photoLibrary");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "librarySpecificFetchOptions");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = (void *)MEMORY[0x1E0CD16C0];
      objc_msgSend(v50, "personLocalIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "fetchPersonsWithLocalIdentifiers:options:", v35, v45);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v44, "firstObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "displayName");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = objc_msgSend(v46, "length");
      v38 = v46;
      if (!v37)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("PGPeopleTitleFormatGenericUnnamedPerson"), CFSTR("PGPeopleTitleFormatGenericUnnamedPerson"), CFSTR("Localizable"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[PGSingleAssetSuggestion setTitle:](v31, "setTitle:", v38);
      if (!v37)
      {

      }
      objc_msgSend(v30, "localCreationDate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v39, 2, 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGSingleAssetSuggestion setSubtitle:](v31, "setSubtitle:", v40);

      if (!v8)
        goto LABEL_46;
    }
    else
    {
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v84) = 0;
        _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_DEFAULT, "Recent Person Centric: no eligible best asset, cannot generate suggestion", (uint8_t *)&v84, 2u);
      }
      v30 = 0;
      v31 = 0;
      if (!v8)
        goto LABEL_46;
    }
    v41 = CFAbsoluteTimeGetCurrent();
    if (v41 - v76[3] >= 0.01)
    {
      v76[3] = v41;
      v53 = 0;
      ((void (**)(void *, char *, double))v25)[2](v25, &v53, 1.0);
      v42 = *((_BYTE *)v80 + 24) | v53;
      *((_BYTE *)v80 + 24) = v42;
      if (v42)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          v84 = 67109378;
          v85 = 212;
          v86 = 2080;
          v87 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v84, 0x12u);
        }
        v11 = 0;
        goto LABEL_47;
      }
    }
LABEL_46:
    v11 = v31;
LABEL_47:

    goto LABEL_48;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    buf = 0x8D04000202;
    LOWORD(v89) = 2080;
    *(_QWORD *)((char *)&v89 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
  v11 = 0;
LABEL_50:
  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v79, 8);

  return v11;
}

- (id)nextSuggestionWithProgress:(id)a3
{
  void (**v4)(void *, _BYTE *, double);
  double Current;
  char v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  double v12;
  char v13;
  int v14;
  void (**v15)(void *, _BYTE *, double);
  uint64_t v16;
  void *v17;
  double v18;
  char v19;
  id v21;
  NSObject *oslog;
  _QWORD v23[4];
  void (**v24)(void *, _BYTE *, double);
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  double *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint8_t buf[4];
  _BYTE v43[14];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v4 = (void (**)(void *, _BYTE *, double))_Block_copy(v21);
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v34 = 0;
  v35 = (double *)&v34;
  v36 = 0x2020000000;
  v37 = 0;
  if (v4)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v35[3] >= 0.01)
    {
      v35[3] = Current;
      v33 = 0;
      v4[2](v4, &v33, 0.0);
      v6 = *((_BYTE *)v39 + 24) | v33;
      *((_BYTE *)v39 + 24) = v6;
      if (v6)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v43 = 220;
          *(_WORD *)&v43[4] = 2080;
          *(_QWORD *)&v43[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v7 = 0;
        goto LABEL_45;
      }
    }
  }
  -[PGAbstractSuggester session](self, "session", v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "loggingConnection");
  oslog = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_DEFAULT, "Recent Person Centric: nextSuggestion", buf, 2u);
  }
  v9 = 0;
  v10 = MEMORY[0x1E0C81028];
  do
  {
    if (v9)
      goto LABEL_32;
    v11 = (void *)MEMORY[0x1CAA4EB2C]();
    if (v4
      && (v12 = CFAbsoluteTimeGetCurrent(), v12 - v35[3] >= 0.01)
      && (v35[3] = v12,
          v33 = 0,
          v4[2](v4, &v33, 0.5),
          v13 = *((_BYTE *)v39 + 24) | v33,
          (*((_BYTE *)v39 + 24) = v13) != 0))
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v43 = 227;
        *(_WORD *)&v43[4] = 2080;
        *(_QWORD *)&v43[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
        _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v9 = 0;
      v14 = 1;
    }
    else
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __61__PGRecentPersonCentricSuggester_nextSuggestionWithProgress___block_invoke;
      v28[3] = &unk_1E8434F30;
      v15 = v4;
      v29 = v15;
      v30 = &v34;
      v31 = &v38;
      v32 = 0x3F847AE147AE147BLL;
      -[PGRecentPersonCentricSuggester nextPotentialSuggestionWithProgress:](self, "nextPotentialSuggestionWithProgress:", v28);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (*((_BYTE *)v39 + 24))
      {
        v14 = 1;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v43 = 232;
          *(_WORD *)&v43[4] = 2080;
          *(_QWORD *)&v43[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
          _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v9 = 0;
      }
      else if (v16)
      {
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __61__PGRecentPersonCentricSuggester_nextSuggestionWithProgress___block_invoke_169;
        v23[3] = &unk_1E8434F30;
        v24 = v15;
        v25 = &v34;
        v26 = &v38;
        v27 = 0x3F847AE147AE147BLL;
        -[PGRecentPersonCentricSuggester suggestionWithPotentialSuggestion:progress:](self, "suggestionWithPotentialSuggestion:progress:", v17, v23);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        if (*((_BYTE *)v39 + 24))
        {
          v14 = 1;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v43 = 241;
            *(_WORD *)&v43[4] = 2080;
            *(_QWORD *)&v43[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
            _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v9 = 0;
        v14 = 3;
      }

    }
    objc_autoreleasePoolPop(v11);
  }
  while (!v14);
  if (v14 != 3)
  {
LABEL_39:
    v7 = 0;
    goto LABEL_44;
  }
  if (v9)
  {
LABEL_32:
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      *(_QWORD *)v43 = v9;
      _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_DEFAULT, "Recent Person Centric: Suggesting %{private}@", buf, 0xCu);
    }
    if (!v4)
      goto LABEL_43;
  }
  else
  {
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_DEFAULT, "Recent Person Centric: Nothing to suggest", buf, 2u);
    }
    v9 = 0;
    if (!v4)
      goto LABEL_43;
  }
  v18 = CFAbsoluteTimeGetCurrent();
  if (v18 - v35[3] >= 0.01)
  {
    v35[3] = v18;
    v33 = 0;
    v4[2](v4, &v33, 1.0);
    v19 = *((_BYTE *)v39 + 24) | v33;
    *((_BYTE *)v39 + 24) = v19;
    if (v19)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v43 = 253;
        *(_WORD *)&v43[4] = 2080;
        *(_QWORD *)&v43[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_39;
    }
  }
LABEL_43:
  v9 = v9;
  v7 = v9;
LABEL_44:

LABEL_45:
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  return v7;
}

- (void)reset
{
  void *v3;
  NSObject *v4;
  NSEnumerator *birthdayPersonPotentialSuggestionEnumerator;
  NSEnumerator *longTimeNoSeePersonPotentialSuggestionEnumerator;
  NSEnumerator *personPotentialSuggestionEnumerator;
  uint8_t v8[16];

  -[PGAbstractSuggester session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loggingConnection");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1CA237000, v4, OS_LOG_TYPE_DEFAULT, "Recent Person Centric: Resetting", v8, 2u);
  }

  birthdayPersonPotentialSuggestionEnumerator = self->_birthdayPersonPotentialSuggestionEnumerator;
  self->_birthdayPersonPotentialSuggestionEnumerator = 0;

  longTimeNoSeePersonPotentialSuggestionEnumerator = self->_longTimeNoSeePersonPotentialSuggestionEnumerator;
  self->_longTimeNoSeePersonPotentialSuggestionEnumerator = 0;

  personPotentialSuggestionEnumerator = self->_personPotentialSuggestionEnumerator;
  self->_personPotentialSuggestionEnumerator = 0;

}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  void *v6;
  double v7;
  char v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  NSObject *v15;
  void *v16;
  double Current;
  char v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  char v24;
  id v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  double v34;
  double v35;
  char v36;
  uint64_t v37;
  double *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint8_t buf[4];
  int v46;
  __int16 v47;
  const char *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v26 = a4;
  v6 = _Block_copy(v26);
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v37 = 0;
  v38 = (double *)&v37;
  v39 = 0x2020000000;
  v40 = 0;
  if (v6
    && (v7 = CFAbsoluteTimeGetCurrent(), v7 - v38[3] >= 0.01)
    && (v38[3] = v7,
        v36 = 0,
        (*((void (**)(void *, char *, double))v6 + 2))(v6, &v36, 0.0),
        v8 = *((_BYTE *)v42 + 24) | v36,
        (*((_BYTE *)v42 + 24) = v8) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v46 = 269;
      v47 = 2080;
      v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestion"
            "s/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v9 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[PGRecentPersonCentricSuggester startSuggestingWithOptions:](self, "startSuggestingWithOptions:", v28);
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = objc_msgSend(v28, "maximumNumberOfSuggestions");
    v27 = v10;
    v12 = 0;
    if (v11)
      v13 = v11;
    else
      v13 = -1;
    v14 = 0.0;
    v15 = MEMORY[0x1E0C81028];
    while (v12 < v13)
    {
      v16 = (void *)MEMORY[0x1CAA4EB2C]();
      if (v6
        && (Current = CFAbsoluteTimeGetCurrent(), Current - v38[3] >= 0.01)
        && (v38[3] = Current,
            v36 = 0,
            (*((void (**)(void *, char *, double))v6 + 2))(v6, &v36, v14),
            v18 = *((_BYTE *)v42 + 24) | v36,
            (*((_BYTE *)v42 + 24) = v18) != 0))
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v46 = 280;
          v47 = 2080;
          v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
          _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v19 = 1;
      }
      else
      {
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __66__PGRecentPersonCentricSuggester_suggestionsWithOptions_progress___block_invoke;
        v29[3] = &unk_1E84311C8;
        v30 = v6;
        v31 = &v37;
        v34 = v14;
        v35 = 1.0 / (double)v13;
        v32 = &v41;
        v33 = 0x3F847AE147AE147BLL;
        -[PGRecentPersonCentricSuggester nextSuggestionWithProgress:](self, "nextSuggestionWithProgress:", v29);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        if (*((_BYTE *)v42 + 24))
        {
          v19 = 1;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v46 = 285;
            v47 = 2080;
            v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
            _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
        else if (v20)
        {
          objc_msgSend(v27, "addObject:", v20);
          v19 = 0;
          ++v12;
          v14 = 1.0 / (double)v13 + v14;
        }
        else
        {
          v19 = 3;
        }

      }
      objc_autoreleasePoolPop(v16);
      if (v19)
      {
        if (v19 != 3)
        {
          v9 = (id)MEMORY[0x1E0C9AA60];
          v22 = v27;
          goto LABEL_35;
        }
        break;
      }
    }
    v22 = v27;
    if (v6
      && (v23 = CFAbsoluteTimeGetCurrent(), v23 - v38[3] >= 0.01)
      && (v38[3] = v23,
          v36 = 0,
          (*((void (**)(void *, char *, double))v6 + 2))(v6, &v36, 1.0),
          v24 = *((_BYTE *)v42 + 24) | v36,
          (*((_BYTE *)v42 + 24) = v24) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v46 = 295;
        v47 = 2080;
        v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v9 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v9 = v27;
    }
LABEL_35:

  }
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v9;
}

- (BOOL)canGenerateSuggestionWithAsset:(id)a3 onDate:(id)a4
{
  id v6;
  id v7;
  PGSuggestionOptions *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(PGSuggestionOptions);
  -[PGSuggestionOptions setLocalToday:](v8, "setLocalToday:", v7);

  objc_msgSend(v6, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSuggestionOptions setUniversalStartDate:](v8, "setUniversalStartDate:", v9);

  v22 = CFSTR("assetUUID");
  objc_msgSend(v6, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSuggestionOptions setAdditionalOptions:](v8, "setAdditionalOptions:", v11);

  -[PGSuggestionOptions setMaximumNumberOfSuggestions:](v8, "setMaximumNumberOfSuggestions:", 1);
  -[PGRecentPersonCentricSuggester suggestionsWithOptions:progress:](self, "suggestionsWithOptions:progress:", v8, &__block_literal_global_31127);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") == 1)
  {
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "keyAssets");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count") == 1)
    {
      objc_msgSend(v12, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "keyAssets");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqualToString:", v18);

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)assetsWithSinglePersonWithOptions:(id)a3 progress:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "additionalOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("assetUUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "universalStartDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "universalEndDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGRecentPersonCentricSuggester assetsWithSinglePersonBetweenStartDate:andEndDate:matchingAssetUUID:progress:](self, "assetsWithSinglePersonBetweenStartDate:andEndDate:matchingAssetUUID:progress:", v10, v11, v9, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)assetsByPersonLocalIdentifierWithOptions:(id)a3 progress:(id)a4
{
  double v6;
  char v7;
  id v8;
  NSObject *v9;
  double v10;
  char v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t i;
  void *v18;
  double Current;
  char v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  id v26;
  double v27;
  char v28;
  void *v30;
  id v31;
  id v32;
  id v33;
  id obj;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  id v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  double *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  _BYTE v60[128];
  uint8_t v61[128];
  uint8_t buf[4];
  int v63;
  __int16 v64;
  const char *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v31 = a4;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  v52 = 0;
  v53 = (double *)&v52;
  v54 = 0x2020000000;
  v55 = 0;
  v37 = _Block_copy(v31);
  if (!v37
    || (v6 = CFAbsoluteTimeGetCurrent(), v6 - v53[3] < 0.01)
    || (v53[3] = v6,
        v51 = 0,
        (*((void (**)(void *, char *, double))v37 + 2))(v37, &v51, 0.0),
        v7 = *((_BYTE *)v57 + 24) | v51,
        (*((_BYTE *)v57 + 24) = v7) == 0))
  {
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __84__PGRecentPersonCentricSuggester_assetsByPersonLocalIdentifierWithOptions_progress___block_invoke;
    v46[3] = &unk_1E8434F30;
    v33 = v37;
    v47 = v33;
    v48 = &v52;
    v49 = &v56;
    v50 = 0x3F847AE147AE147BLL;
    -[PGRecentPersonCentricSuggester assetsWithSinglePersonWithOptions:progress:](self, "assetsWithSinglePersonWithOptions:progress:", v32, v46);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v57 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v63 = 338;
        v64 = 2080;
        v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
        v9 = MEMORY[0x1E0C81028];
LABEL_10:
        _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if (!v37
        || (v10 = CFAbsoluteTimeGetCurrent(), v10 - v53[3] < 0.01)
        || (v53[3] = v10,
            v51 = 0,
            (*((void (**)(id, char *, double))v33 + 2))(v33, &v51, 0.8),
            v11 = *((_BYTE *)v57 + 24) | v51,
            (*((_BYTE *)v57 + 24) = v11) == 0))
      {
        v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v13 = objc_msgSend(v30, "count");
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        obj = v30;
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v61, 16);
        if (v14)
        {
          v15 = 1.0 / (double)v13;
          v35 = *(_QWORD *)v43;
          v16 = 0.0;
          while (2)
          {
            v36 = v14;
            for (i = 0; i != v36; ++i)
            {
              if (*(_QWORD *)v43 != v35)
                objc_enumerationMutation(obj);
              v18 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
              if (v37)
              {
                Current = CFAbsoluteTimeGetCurrent();
                if (Current - v53[3] >= 0.01)
                {
                  v53[3] = Current;
                  v51 = 0;
                  (*((void (**)(id, char *, double))v33 + 2))(v33, &v51, v16 * 0.2 + 0.8);
                  v20 = *((_BYTE *)v57 + 24) | v51;
                  *((_BYTE *)v57 + 24) = v20;
                  if (v20)
                  {
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 67109378;
                      v63 = 347;
                      v64 = 2080;
                      v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
                      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                    }

                    goto LABEL_44;
                  }
                }
              }
              v40 = 0u;
              v41 = 0u;
              v38 = 0u;
              v39 = 0u;
              objc_msgSend(v18, "clsPersonLocalIdentifiers", v30, v31);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v60, 16);
              if (v22)
              {
                v23 = *(_QWORD *)v39;
                do
                {
                  for (j = 0; j != v22; ++j)
                  {
                    if (*(_QWORD *)v39 != v23)
                      objc_enumerationMutation(v21);
                    v25 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
                    objc_msgSend(v12, "objectForKeyedSubscript:", v25);
                    v26 = (id)objc_claimAutoreleasedReturnValue();
                    if (!v26)
                    {
                      v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                      objc_msgSend(v12, "setObject:forKeyedSubscript:", v26, v25);
                    }
                    objc_msgSend(v26, "addObject:", v18);

                  }
                  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v60, 16);
                }
                while (v22);
              }

              v16 = v15 + v16;
            }
            v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v61, 16);
            if (v14)
              continue;
            break;
          }
        }

        if (v37
          && (v27 = CFAbsoluteTimeGetCurrent(), v27 - v53[3] >= 0.01)
          && (v53[3] = v27,
              v51 = 0,
              (*((void (**)(id, char *, double))v33 + 2))(v33, &v51, 1.0),
              v28 = *((_BYTE *)v57 + 24) | v51,
              (*((_BYTE *)v57 + 24) = v28) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v63 = 363;
            v64 = 2080;
            v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_44:
          v8 = (id)MEMORY[0x1E0C9AA70];
        }
        else
        {
          v8 = v12;
        }

        goto LABEL_47;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v63 = 340;
        v64 = 2080;
        v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
        v9 = MEMORY[0x1E0C81028];
        goto LABEL_10;
      }
    }
    v8 = (id)MEMORY[0x1E0C9AA70];
LABEL_47:

    goto LABEL_48;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v63 = 333;
    v64 = 2080;
    v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestions/"
          "Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v8 = (id)MEMORY[0x1E0C9AA70];
LABEL_48:
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);

  return v8;
}

- (unint64_t)relationScoreWithPersonNode:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isMyPartner") & 1) != 0 || (objc_msgSend(v3, "isMyInferredPartner") & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isMyChild") & 1) != 0 || (objc_msgSend(v3, "isMyInferredChild") & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isMyParent") & 1) != 0 || (objc_msgSend(v3, "isMyInferredParent") & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isMemberOfMyFamily") & 1) != 0
         || (objc_msgSend(v3, "isInferredMemberOfMyFamily") & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isMyFriend") & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isMyInferredFriend"))
  {
    v4 = 5;
  }
  else
  {
    v4 = 6;
  }

  return v4;
}

- (id)birthdayPersonPotentialSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  void (**v6)(void *, mach_timebase_info *, double);
  double Current;
  char v8;
  NSObject *v9;
  double v10;
  char v11;
  void *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  id v26;
  NSDictionary *v27;
  NSDictionary *assetsByPersonLocalIdentifier;
  uint64_t v29;
  uint32_t denom;
  uint32_t numer;
  NSObject *v32;
  NSObject *v33;
  double v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  char v41;
  uint64_t v43;
  void (**v44)(void *, mach_timebase_info *, double);
  void *v45;
  NSObject *v46;
  id v47;
  id v48;
  char v49;
  _QWORD v50[5];
  id v51;
  void (**v52)(void *, mach_timebase_info *, double);
  uint64_t *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  mach_timebase_info info;
  _QWORD v59[4];
  void (**v60)(void *, mach_timebase_info *, double);
  uint64_t *v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  double *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  char v71;
  _QWORD v72[3];
  int buf;
  _QWORD v74[5];

  *(_QWORD *)((char *)&v74[2] + 4) = *MEMORY[0x1E0C80C00];
  v48 = a3;
  v47 = a4;
  v6 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(v47);
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v71 = 0;
  v64 = 0;
  v65 = (double *)&v64;
  v66 = 0x2020000000;
  v67 = 0;
  if (v6)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v65[3] >= 0.01)
    {
      v65[3] = Current;
      LOBYTE(info.numer) = 0;
      v6[2](v6, &info, 0.0);
      v8 = *((_BYTE *)v69 + 24) | LOBYTE(info.numer);
      *((_BYTE *)v69 + 24) = v8;
      if (v8)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          buf = 67109378;
          LODWORD(v74[0]) = 381;
          WORD2(v74[0]) = 2080;
          *(_QWORD *)((char *)v74 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPerson"
                                         "CentricSuggester.m";
          v9 = MEMORY[0x1E0C81028];
LABEL_12:
          _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
          goto LABEL_25;
        }
        goto LABEL_25;
      }
    }
  }
  if (!self->_assetsByPersonLocalIdentifier)
  {
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __89__PGRecentPersonCentricSuggester_birthdayPersonPotentialSuggestionsWithOptions_progress___block_invoke;
    v59[3] = &unk_1E8434F30;
    v60 = v6;
    v61 = &v64;
    v62 = &v68;
    v63 = 0x3F847AE147AE147BLL;
    -[PGRecentPersonCentricSuggester assetsByPersonLocalIdentifierWithOptions:progress:](self, "assetsByPersonLocalIdentifierWithOptions:progress:", v48, v59);
    v27 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    assetsByPersonLocalIdentifier = self->_assetsByPersonLocalIdentifier;
    self->_assetsByPersonLocalIdentifier = v27;

    if (*((_BYTE *)v69 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        buf = 67109378;
        LODWORD(v74[0]) = 388;
        WORD2(v74[0]) = 2080;
        *(_QWORD *)((char *)v74 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      }

      goto LABEL_25;
    }

  }
  if (!v6
    || (v10 = CFAbsoluteTimeGetCurrent(), v10 - v65[3] < 0.01)
    || (v65[3] = v10,
        LOBYTE(info.numer) = 0,
        v6[2](v6, &info, 0.5),
        v11 = *((_BYTE *)v69 + 24) | LOBYTE(info.numer),
        (*((_BYTE *)v69 + 24) = v11) == 0))
  {
    -[PGAbstractSuggester session](self, "session");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingConnection");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_signpost_id_generate(v13);
    v15 = v13;
    v16 = v15;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "BirthdayPersonPotentialSuggestions", ", (uint8_t *)&buf, 2u);
    }
    v46 = v16;

    info = 0;
    mach_timebase_info(&info);
    v17 = mach_absolute_time();
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v43 = v17;
    objc_msgSend(v48, "localToday");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(MEMORY[0x1E0D4B130], "monthFromDate:", v19);
    v45 = (void *)v19;
    v21 = objc_msgSend(MEMORY[0x1E0D4B130], "dayFromDate:", v19);
    objc_msgSend(v12, "workingContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __89__PGRecentPersonCentricSuggester_birthdayPersonPotentialSuggestionsWithOptions_progress___block_invoke_174;
    v50[3] = &unk_1E842CE58;
    v53 = &v64;
    v54 = &v68;
    v44 = v6;
    v52 = v44;
    v50[4] = self;
    v55 = 0x3F847AE147AE147BLL;
    v56 = v20;
    v57 = v21;
    v23 = v18;
    v51 = v23;
    objc_msgSend(v22, "performSynchronousConcurrentGraphReadUsingBlock:", v50);

    v24 = v12;
    if (*((_BYTE *)v69 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        buf = 67109378;
        LODWORD(v74[0]) = 429;
        WORD2(v74[0]) = 2080;
        *(_QWORD *)((char *)v74 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
        v25 = MEMORY[0x1E0C81028];
LABEL_19:
        _os_log_impl(&dword_1CA237000, v25, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      }
    }
    else
    {
      v29 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v32 = v46;
      v33 = v32;
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v33, OS_SIGNPOST_INTERVAL_END, v14, "BirthdayPersonPotentialSuggestions", ", (uint8_t *)&buf, 2u);
      }

      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        buf = 136315394;
        v74[0] = "BirthdayPersonPotentialSuggestions";
        LOWORD(v74[1]) = 2048;
        *(double *)((char *)&v74[1] + 2) = (float)((float)((float)((float)(v29 - v43) * (float)numer) / (float)denom)
                                                 / 1000000.0);
        _os_log_impl(&dword_1CA237000, v33, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&buf, 0x16u);
      }
      if (!v6
        || (v34 = CFAbsoluteTimeGetCurrent(), v34 - v65[3] < 0.01)
        || (v65[3] = v34,
            v49 = 0,
            v44[2](v44, (mach_timebase_info *)&v49, 0.9),
            v35 = *((_BYTE *)v69 + 24) | v49,
            (*((_BYTE *)v69 + 24) = v35) == 0))
      {
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("relationshipScore"), 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v72[0] = v36;
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("assets.@count"), 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v72[1] = v37;
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("personLocalIdentifier"), 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v72[2] = v38;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 3);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "sortUsingDescriptors:", v39);
        if (v6
          && (v40 = CFAbsoluteTimeGetCurrent(), v40 - v65[3] >= 0.01)
          && (v65[3] = v40,
              v49 = 0,
              v44[2](v44, (mach_timebase_info *)&v49, 1.0),
              v41 = *((_BYTE *)v69 + 24) | v49,
              (*((_BYTE *)v69 + 24) = v41) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            buf = 67109378;
            LODWORD(v74[0]) = 441;
            WORD2(v74[0]) = 2080;
            *(_QWORD *)((char *)v74 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/P"
                                           "hotosGraph/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPe"
                                           "rsonCentricSuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
          }
          v26 = (id)MEMORY[0x1E0C9AA60];
        }
        else
        {
          v26 = v23;
        }

        goto LABEL_44;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        buf = 67109378;
        LODWORD(v74[0]) = 433;
        WORD2(v74[0]) = 2080;
        *(_QWORD *)((char *)v74 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
        v25 = MEMORY[0x1E0C81028];
        goto LABEL_19;
      }
    }
    v26 = (id)MEMORY[0x1E0C9AA60];
LABEL_44:

    goto LABEL_45;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    buf = 67109378;
    LODWORD(v74[0]) = 391;
    WORD2(v74[0]) = 2080;
    *(_QWORD *)((char *)v74 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
    v9 = MEMORY[0x1E0C81028];
    goto LABEL_12;
  }
LABEL_25:
  v26 = (id)MEMORY[0x1E0C9AA60];
LABEL_45:
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);

  return v26;
}

- (id)longTimeNoSeePersonPotentialSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  double v5;
  char v6;
  id v7;
  void *v8;
  double v9;
  char v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t i;
  void *v18;
  double Current;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  _BOOL4 v29;
  PGPotentialRecentPersonCentricSuggestion *v30;
  double v31;
  char v32;
  void *v33;
  NSDictionary *v34;
  NSDictionary *assetsByPersonLocalIdentifier;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  char v41;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  double *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  _QWORD v69[3];
  uint8_t v70[128];
  uint8_t buf[4];
  int v72;
  __int16 v73;
  const char *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v44 = a4;
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 0;
  v61 = 0;
  v62 = (double *)&v61;
  v63 = 0x2020000000;
  v64 = 0;
  v49 = _Block_copy(v44);
  if (!v49
    || (v5 = CFAbsoluteTimeGetCurrent(), v5 - v62[3] < 0.01)
    || (v62[3] = v5,
        v60 = 0,
        (*((void (**)(void *, char *, double))v49 + 2))(v49, &v60, 0.0),
        v6 = *((_BYTE *)v66 + 24) | v60,
        (*((_BYTE *)v66 + 24) = v6) == 0))
  {
    objc_msgSend(v47, "universalStartDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (!self->_assetsByPersonLocalIdentifier)
      {
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __94__PGRecentPersonCentricSuggester_longTimeNoSeePersonPotentialSuggestionsWithOptions_progress___block_invoke;
        v55[3] = &unk_1E8434F30;
        v56 = v49;
        v57 = &v61;
        v58 = &v65;
        v59 = 0x3F847AE147AE147BLL;
        -[PGRecentPersonCentricSuggester assetsByPersonLocalIdentifierWithOptions:progress:](self, "assetsByPersonLocalIdentifierWithOptions:progress:", v47, v55);
        v34 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        assetsByPersonLocalIdentifier = self->_assetsByPersonLocalIdentifier;
        self->_assetsByPersonLocalIdentifier = v34;

        if (*((_BYTE *)v66 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v72 = 462;
            v73 = 2080;
            v74 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          goto LABEL_41;
        }

      }
      if (!v49
        || (v9 = CFAbsoluteTimeGetCurrent(), v9 - v62[3] < 0.01)
        || (v62[3] = v9,
            v60 = 0,
            (*((void (**)(void *, char *, double))v49 + 2))(v49, &v60, 0.5),
            v10 = *((_BYTE *)v66 + 24) | v60,
            (*((_BYTE *)v66 + 24) = v10) == 0))
      {
        v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[PGRecentPersonCentricSuggester verifiedPersonByPersonLocalIdentifier](self, "verifiedPersonByPersonLocalIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        objc_msgSend(v11, "objectEnumerator");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v70, 16);
        v43 = v11;
        v46 = v8;
        if (v14)
        {
          v15 = 1.0 / (double)v12;
          v48 = *(_QWORD *)v52;
          v16 = 0.0;
          while (2)
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v52 != v48)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
              if (v49)
              {
                Current = CFAbsoluteTimeGetCurrent();
                if (Current - v62[3] >= 0.01)
                {
                  v62[3] = Current;
                  v60 = 0;
                  (*((void (**)(void *, char *, double))v49 + 2))(v49, &v60, v16 * 0.4 + 0.5);
                  v20 = *((_BYTE *)v66 + 24) | v60;
                  *((_BYTE *)v66 + 24) = v20;
                  if (v20)
                  {
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 67109378;
                      v72 = 473;
                      v73 = 2080;
                      v74 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
                      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                    }

                    v7 = (id)MEMORY[0x1E0C9AA60];
                    goto LABEL_53;
                  }
                }
              }
              objc_msgSend(v18, "localIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if ((-[NSMutableSet containsObject:](self->_usedPersonLocalIdentifiers, "containsObject:", v21) & 1) == 0)
              {
                -[NSDictionary objectForKeyedSubscript:](self->_assetsByPersonLocalIdentifier, "objectForKeyedSubscript:", v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if (v22)
                {
                  objc_msgSend(v47, "additionalOptions");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("assetUUID"));
                  v24 = (void *)objc_claimAutoreleasedReturnValue();

                  -[PGRecentPersonCentricSuggester lastAssetWithPerson:beforeDate:matchingAssetUUID:](self, "lastAssetWithPerson:beforeDate:matchingAssetUUID:", v18, v46, v24);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "creationDate");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v25)
                  {
                    objc_msgSend(v47, "universalStartDate");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "timeIntervalSinceDate:", v26);
                    v29 = v28 > 2592000.0;

                    if (v29)
                    {
                      v30 = -[PGPotentialRecentPersonCentricSuggestion initWithPersonLocalIdentifier:assets:notSeenSinceDate:]([PGPotentialRecentPersonCentricSuggestion alloc], "initWithPersonLocalIdentifier:assets:notSeenSinceDate:", v21, v22, v26);
                      objc_msgSend(v45, "addObject:", v30);

                    }
                  }

                }
              }

              v16 = v15 + v16;
            }
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v70, 16);
            if (v14)
              continue;
            break;
          }
        }

        if (v49
          && (v31 = CFAbsoluteTimeGetCurrent(), v31 - v62[3] >= 0.01)
          && (v62[3] = v31,
              v60 = 0,
              (*((void (**)(void *, char *, double))v49 + 2))(v49, &v60, 0.9),
              v32 = *((_BYTE *)v66 + 24) | v60,
              *((_BYTE *)v66 + 24) = v32,
              v33 = v43,
              v32))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v72 = 495;
            v73 = 2080;
            v74 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v7 = (id)MEMORY[0x1E0C9AA60];
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("notSeenSinceDate"), 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v69[0] = v36;
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("assets.@count"), 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v69[1] = v37;
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("personLocalIdentifier"), 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v69[2] = v38;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 3);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v45, "sortUsingDescriptors:", v39);
          if (v49
            && (v40 = CFAbsoluteTimeGetCurrent(), v40 - v62[3] >= 0.01)
            && (v62[3] = v40,
                v60 = 0,
                (*((void (**)(void *, char *, double))v49 + 2))(v49, &v60, 1.0),
                v41 = *((_BYTE *)v66 + 24) | v60,
                (*((_BYTE *)v66 + 24) = v41) != 0))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v72 = 503;
              v73 = 2080;
              v74 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Su"
                    "ggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            v7 = (id)MEMORY[0x1E0C9AA60];
          }
          else
          {
            v7 = v45;
          }

LABEL_53:
          v33 = v43;
        }

        v8 = v46;
        goto LABEL_55;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v72 = 465;
        v73 = 2080;
        v74 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
LABEL_41:
    v7 = (id)MEMORY[0x1E0C9AA60];
LABEL_55:

    goto LABEL_56;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v72 = 449;
    v73 = 2080;
    v74 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestions/"
          "Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v7 = (id)MEMORY[0x1E0C9AA60];
LABEL_56:
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);

  return v7;
}

- (id)personPotentialSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  id v6;
  void (**v7)(void *, _BYTE *, double);
  double Current;
  char v9;
  NSObject *v10;
  double v11;
  char v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  uint64_t i;
  void *v21;
  double v22;
  char v23;
  void *v24;
  void *v25;
  PGPotentialRecentPersonCentricSuggestion *v26;
  double v27;
  char v28;
  NSDictionary *v29;
  NSDictionary *assetsByPersonLocalIdentifier;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  char v36;
  void *v38;
  void *v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  void (**v47)(void *, _BYTE *, double);
  uint64_t *v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  double *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  _QWORD v60[2];
  uint8_t v61[128];
  uint8_t buf[4];
  int v63;
  __int16 v64;
  const char *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v40 = a4;
  v7 = (void (**)(void *, _BYTE *, double))_Block_copy(v40);
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  v52 = 0;
  v53 = (double *)&v52;
  v54 = 0x2020000000;
  v55 = 0;
  v39 = v6;
  if (v7)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v53[3] >= 0.01)
    {
      v53[3] = Current;
      v51 = 0;
      v7[2](v7, &v51, 0.0);
      v9 = *((_BYTE *)v57 + 24) | v51;
      *((_BYTE *)v57 + 24) = v9;
      if (v9)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v63 = 511;
          v64 = 2080;
          v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
          v10 = MEMORY[0x1E0C81028];
LABEL_12:
          _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_36;
        }
        goto LABEL_36;
      }
    }
  }
  if (!self->_assetsByPersonLocalIdentifier)
  {
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __81__PGRecentPersonCentricSuggester_personPotentialSuggestionsWithOptions_progress___block_invoke;
    v46[3] = &unk_1E8434F30;
    v47 = v7;
    v48 = &v52;
    v49 = &v56;
    v50 = 0x3F847AE147AE147BLL;
    -[PGRecentPersonCentricSuggester assetsByPersonLocalIdentifierWithOptions:progress:](self, "assetsByPersonLocalIdentifierWithOptions:progress:", v6, v46);
    v29 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    assetsByPersonLocalIdentifier = self->_assetsByPersonLocalIdentifier;
    self->_assetsByPersonLocalIdentifier = v29;

    if (*((_BYTE *)v57 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v63 = 518;
        v64 = 2080;
        v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }

      goto LABEL_36;
    }

  }
  if (v7)
  {
    v11 = CFAbsoluteTimeGetCurrent();
    if (v11 - v53[3] >= 0.01)
    {
      v53[3] = v11;
      v51 = 0;
      v7[2](v7, &v51, 0.5);
      v12 = *((_BYTE *)v57 + 24) | v51;
      *((_BYTE *)v57 + 24) = v12;
      if (v12)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v63 = 521;
          v64 = 2080;
          v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
          v10 = MEMORY[0x1E0C81028];
          goto LABEL_12;
        }
LABEL_36:
        v31 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_50;
      }
    }
  }
  v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PGRecentPersonCentricSuggester verifiedPersonByPersonLocalIdentifier](self, "verifiedPersonByPersonLocalIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v38 = v13;
  objc_msgSend(v13, "objectEnumerator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v61, 16);
  if (v16)
  {
    v17 = 1.0 / (double)v14;
    v18 = *(_QWORD *)v43;
    v19 = 0.0;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v43 != v18)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        if (v7)
        {
          v22 = CFAbsoluteTimeGetCurrent();
          if (v22 - v53[3] >= 0.01)
          {
            v53[3] = v22;
            v51 = 0;
            v7[2](v7, &v51, v19 * 0.4 + 0.5);
            v23 = *((_BYTE *)v57 + 24) | v51;
            *((_BYTE *)v57 + 24) = v23;
            if (v23)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                v63 = 529;
                v64 = 2080;
                v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              goto LABEL_40;
            }
          }
        }
        objc_msgSend(v21, "localIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[NSMutableSet containsObject:](self->_usedPersonLocalIdentifiers, "containsObject:", v24) & 1) == 0)
        {
          -[NSDictionary objectForKeyedSubscript:](self->_assetsByPersonLocalIdentifier, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            v26 = -[PGPotentialRecentPersonCentricSuggestion initWithPersonLocalIdentifier:assets:notSeenSinceDate:]([PGPotentialRecentPersonCentricSuggestion alloc], "initWithPersonLocalIdentifier:assets:notSeenSinceDate:", v24, v25, 0);
            objc_msgSend(v41, "addObject:", v26);

          }
        }

        v19 = v17 + v19;
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v61, 16);
      if (v16)
        continue;
      break;
    }
  }

  if (v7
    && (v27 = CFAbsoluteTimeGetCurrent(), v27 - v53[3] >= 0.01)
    && (v53[3] = v27, v51 = 0, v7[2](v7, &v51, 0.9), v28 = *((_BYTE *)v57 + 24) | v51, (*((_BYTE *)v57 + 24) = v28) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v63 = 545;
      v64 = 2080;
      v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestion"
            "s/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
LABEL_40:
    v31 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("assets.@count"), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v32;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("personLocalIdentifier"), 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "sortUsingDescriptors:", v34);
    if (v7
      && (v35 = CFAbsoluteTimeGetCurrent(), v35 - v53[3] >= 0.01)
      && (v53[3] = v35,
          v51 = 0,
          v7[2](v7, &v51, 1.0),
          v36 = *((_BYTE *)v57 + 24) | v51,
          (*((_BYTE *)v57 + 24) = v36) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v63 = 552;
        v64 = 2080;
        v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v31 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v31 = v41;
    }

  }
LABEL_50:
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);

  return v31;
}

- (id)nextBirthdayPersonPotentialSuggestionWithProgress:(id)a3
{
  id v4;
  NSEnumerator *birthdayPersonPotentialSuggestionEnumerator;
  NSArray *birthdayPersonPotentialSuggestions;
  NSArray *v7;
  NSArray *v8;
  NSEnumerator *v9;
  NSEnumerator *v10;
  void *v11;

  v4 = a3;
  birthdayPersonPotentialSuggestionEnumerator = self->_birthdayPersonPotentialSuggestionEnumerator;
  if (!birthdayPersonPotentialSuggestionEnumerator)
  {
    birthdayPersonPotentialSuggestions = self->_birthdayPersonPotentialSuggestions;
    if (!birthdayPersonPotentialSuggestions)
    {
      -[PGRecentPersonCentricSuggester birthdayPersonPotentialSuggestionsWithOptions:progress:](self, "birthdayPersonPotentialSuggestionsWithOptions:progress:", self->_options, v4);
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v8 = self->_birthdayPersonPotentialSuggestions;
      self->_birthdayPersonPotentialSuggestions = v7;

      -[PGRecentPersonCentricSuggester updateUsedPersonLocalIdentifiersFromPotentialSuggestions:](self, "updateUsedPersonLocalIdentifiersFromPotentialSuggestions:", self->_birthdayPersonPotentialSuggestions);
      birthdayPersonPotentialSuggestions = self->_birthdayPersonPotentialSuggestions;
    }
    -[NSArray objectEnumerator](birthdayPersonPotentialSuggestions, "objectEnumerator");
    v9 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
    v10 = self->_birthdayPersonPotentialSuggestionEnumerator;
    self->_birthdayPersonPotentialSuggestionEnumerator = v9;

    birthdayPersonPotentialSuggestionEnumerator = self->_birthdayPersonPotentialSuggestionEnumerator;
  }
  -[NSEnumerator nextObject](birthdayPersonPotentialSuggestionEnumerator, "nextObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)nextLongTimeNoSeePersonPotentialSuggestionWithProgress:(id)a3
{
  id v4;
  NSEnumerator *longTimeNoSeePersonPotentialSuggestionEnumerator;
  NSArray *longTimeNoSeePersonPotentialSuggestions;
  NSArray *v7;
  NSArray *v8;
  NSEnumerator *v9;
  NSEnumerator *v10;
  void *v11;

  v4 = a3;
  longTimeNoSeePersonPotentialSuggestionEnumerator = self->_longTimeNoSeePersonPotentialSuggestionEnumerator;
  if (!longTimeNoSeePersonPotentialSuggestionEnumerator)
  {
    longTimeNoSeePersonPotentialSuggestions = self->_longTimeNoSeePersonPotentialSuggestions;
    if (!longTimeNoSeePersonPotentialSuggestions)
    {
      -[PGRecentPersonCentricSuggester longTimeNoSeePersonPotentialSuggestionsWithOptions:progress:](self, "longTimeNoSeePersonPotentialSuggestionsWithOptions:progress:", self->_options, v4);
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v8 = self->_longTimeNoSeePersonPotentialSuggestions;
      self->_longTimeNoSeePersonPotentialSuggestions = v7;

      -[PGRecentPersonCentricSuggester updateUsedPersonLocalIdentifiersFromPotentialSuggestions:](self, "updateUsedPersonLocalIdentifiersFromPotentialSuggestions:", self->_longTimeNoSeePersonPotentialSuggestions);
      longTimeNoSeePersonPotentialSuggestions = self->_longTimeNoSeePersonPotentialSuggestions;
    }
    -[NSArray objectEnumerator](longTimeNoSeePersonPotentialSuggestions, "objectEnumerator");
    v9 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
    v10 = self->_longTimeNoSeePersonPotentialSuggestionEnumerator;
    self->_longTimeNoSeePersonPotentialSuggestionEnumerator = v9;

    longTimeNoSeePersonPotentialSuggestionEnumerator = self->_longTimeNoSeePersonPotentialSuggestionEnumerator;
  }
  -[NSEnumerator nextObject](longTimeNoSeePersonPotentialSuggestionEnumerator, "nextObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)nextPersonPotentialSuggestionWithProgress:(id)a3
{
  id v4;
  NSEnumerator *personPotentialSuggestionEnumerator;
  NSArray *personPotentialSuggestions;
  NSArray *v7;
  NSArray *v8;
  NSEnumerator *v9;
  NSEnumerator *v10;
  void *v11;

  v4 = a3;
  personPotentialSuggestionEnumerator = self->_personPotentialSuggestionEnumerator;
  if (!personPotentialSuggestionEnumerator)
  {
    personPotentialSuggestions = self->_personPotentialSuggestions;
    if (!personPotentialSuggestions)
    {
      -[PGRecentPersonCentricSuggester personPotentialSuggestionsWithOptions:progress:](self, "personPotentialSuggestionsWithOptions:progress:", self->_options, v4);
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v8 = self->_personPotentialSuggestions;
      self->_personPotentialSuggestions = v7;

      -[PGRecentPersonCentricSuggester updateUsedPersonLocalIdentifiersFromPotentialSuggestions:](self, "updateUsedPersonLocalIdentifiersFromPotentialSuggestions:", self->_personPotentialSuggestions);
      personPotentialSuggestions = self->_personPotentialSuggestions;
    }
    -[NSArray objectEnumerator](personPotentialSuggestions, "objectEnumerator");
    v9 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
    v10 = self->_personPotentialSuggestionEnumerator;
    self->_personPotentialSuggestionEnumerator = v9;

    personPotentialSuggestionEnumerator = self->_personPotentialSuggestionEnumerator;
  }
  -[NSEnumerator nextObject](personPotentialSuggestionEnumerator, "nextObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)verifiedPersonByPersonLocalIdentifier
{
  NSDictionary *verifiedPersonByPersonLocalIdentifier;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSDictionary *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSDictionary *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  verifiedPersonByPersonLocalIdentifier = self->_verifiedPersonByPersonLocalIdentifier;
  if (!verifiedPersonByPersonLocalIdentifier)
  {
    -[PGAbstractSuggester session](self, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "librarySpecificFetchOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setPersonContext:", 1);
    objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v14, "localIdentifier", (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v14, v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    v16 = self->_verifiedPersonByPersonLocalIdentifier;
    self->_verifiedPersonByPersonLocalIdentifier = v8;

    verifiedPersonByPersonLocalIdentifier = self->_verifiedPersonByPersonLocalIdentifier;
  }
  return verifiedPersonByPersonLocalIdentifier;
}

- (id)lastAssetWithPerson:(id)a3 beforeDate:(id)a4 matchingAssetUUID:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0CB3880];
  v10 = a3;
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("dateCreated < %@"), a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v11, 0);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid == %@"), v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

  }
  if ((unint64_t)objc_msgSend(v12, "count") <= 1)
    objc_msgSend(v12, "firstObject");
  else
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGAbstractSuggester defaultAssetFetchOptionsWithInternalPredicate:](self, "defaultAssetFetchOptionsWithInternalPredicate:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSortDescriptors:", v17);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsForPerson:options:", v10, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)assetsWithSinglePersonBetweenStartDate:(id)a3 andEndDate:(id)a4 matchingAssetUUID:(id)a5 progress:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(void *, _BYTE *, double);
  double v14;
  double v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double Current;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  _QWORD v46[5];
  char v47;
  uint8_t buf[4];
  _BYTE v49[18];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(void *, _BYTE *, double))_Block_copy(a6);
  v14 = 0.0;
  if (!v13 || (v15 = CFAbsoluteTimeGetCurrent(), v15 < 0.01))
  {
LABEL_8:
    -[PGAbstractSuggester session](self, "session");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "loggingConnection");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v49 = v10;
      *(_WORD *)&v49[8] = 2112;
      *(_QWORD *)&v49[10] = v11;
      _os_log_impl(&dword_1CA237000, v18, OS_LOG_TYPE_DEFAULT, "Recent Person Centric: Computing eligible single-person assets between %@ and %@", buf, 0x16u);
    }
    -[PGRecentPersonCentricSuggester verifiedPersonByPersonLocalIdentifier](self, "verifiedPersonByPersonLocalIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v19, "count"))
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, v18, OS_LOG_TYPE_DEFAULT, "Recent Person Centric: No verified person, no eligible asset", buf, 2u);
      }
      v16 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_50;
    }
    objc_msgSend((id)objc_opt_class(), "noVideoPredicate");
    v40 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v40, 0);
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dateCreated >= %@"), v10);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v21);

    }
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dateCreated <= %@"), v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v22);

    }
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid == %@"), v12);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v23);

    }
    v43 = v12;
    v44 = v10;
    v42 = v11;
    if ((unint64_t)objc_msgSend(v20, "count") > 1)
      objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v20);
    else
      objc_msgSend(v20, "firstObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGAbstractSuggester defaultAssetFetchOptionsWithInternalPredicate:](self, "defaultAssetFetchOptionsWithInternalPredicate:", v41);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFetchPropertySets:", v25);

    v26 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(v19, "allValues");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "fetchAssetsForPersons:options:", v27, v24);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v14 >= 0.01)
      {
        v47 = 0;
        v13[2](v13, &v47, 0.4);
        if (v47)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v49 = 693;
            *(_WORD *)&v49[4] = 2080;
            *(_QWORD *)&v49[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v16 = (id)MEMORY[0x1E0C9AA60];
          v12 = v43;
          v29 = (void *)v40;
          goto LABEL_49;
        }
        v14 = Current;
      }
    }
    v30 = objc_msgSend(MEMORY[0x1E0CD1390], "clsPrefetchOptionsForKeyAsset");
    v31 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(v17, "curationContext");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "clsAllAssetsFromFetchResult:prefetchOptions:curationContext:", v45, v30, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v34 = CFAbsoluteTimeGetCurrent();
      v11 = v42;
      if (v34 - v14 >= 0.01)
      {
        v47 = 0;
        v13[2](v13, &v47, 0.8);
        if (v47)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v49 = 698;
            *(_WORD *)&v49[4] = 2080;
            *(_QWORD *)&v49[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v16 = (id)MEMORY[0x1E0C9AA60];
LABEL_48:
          v29 = (void *)v40;

          v12 = v43;
LABEL_49:

          v10 = v44;
LABEL_50:

          goto LABEL_51;
        }
        v14 = v34;
      }
    }
    else
    {
      v11 = v42;
    }
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __111__PGRecentPersonCentricSuggester_assetsWithSinglePersonBetweenStartDate_andEndDate_matchingAssetUUID_progress___block_invoke;
    v46[3] = &unk_1E8430EB8;
    v46[4] = self;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v46);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "filteredArrayUsingPredicate:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = v18;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = objc_msgSend(v36, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v49 = v38;
      _os_log_impl(&dword_1CA237000, v37, OS_LOG_TYPE_DEFAULT, "Recent Person Centric: found %lu eligible assets", buf, 0xCu);
    }

    if (v13 && CFAbsoluteTimeGetCurrent() - v14 >= 0.01 && (v47 = 0, v13[2](v13, &v47, 1.0), v47))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v49 = 710;
        *(_WORD *)&v49[4] = 2080;
        *(_QWORD *)&v49[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v16 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v16 = v36;
    }

    goto LABEL_48;
  }
  v47 = 0;
  v13[2](v13, &v47, 0.0);
  if (!v47)
  {
    v14 = v15;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v49 = 655;
    *(_WORD *)&v49[4] = 2080;
    *(_QWORD *)&v49[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Suggestions/Suggesters/Single Asset Suggester/PGRecentPersonCentricSuggester.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v16 = (id)MEMORY[0x1E0C9AA60];
LABEL_51:

  return v16;
}

- (void)updateUsedPersonLocalIdentifiersFromPotentialSuggestions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "personLocalIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](self->_usedPersonLocalIdentifiers, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personPotentialSuggestionEnumerator, 0);
  objc_storeStrong((id *)&self->_longTimeNoSeePersonPotentialSuggestionEnumerator, 0);
  objc_storeStrong((id *)&self->_birthdayPersonPotentialSuggestionEnumerator, 0);
  objc_storeStrong((id *)&self->_personPotentialSuggestions, 0);
  objc_storeStrong((id *)&self->_longTimeNoSeePersonPotentialSuggestions, 0);
  objc_storeStrong((id *)&self->_birthdayPersonPotentialSuggestions, 0);
  objc_storeStrong((id *)&self->_usedPersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_assetsByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_verifiedPersonByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

BOOL __111__PGRecentPersonCentricSuggester_assetsWithSinglePersonBetweenStartDate_andEndDate_matchingAssetUUID_progress___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "assetIsValidForSuggesting:", v3))
  {
    objc_msgSend(v3, "clsFaceInformationSummary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "numberOfFaces") == 1
      && objc_msgSend(v4, "numberOfGoodFacesOfVerifiedPersons") == 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __81__PGRecentPersonCentricSuggester_personPotentialSuggestionsWithOptions_progress___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __94__PGRecentPersonCentricSuggester_longTimeNoSeePersonPotentialSuggestionsWithOptions_progress___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __89__PGRecentPersonCentricSuggester_birthdayPersonPotentialSuggestionsWithOptions_progress___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __89__PGRecentPersonCentricSuggester_birthdayPersonPotentialSuggestionsWithOptions_progress___block_invoke_174(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;

  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__PGRecentPersonCentricSuggester_birthdayPersonPotentialSuggestionsWithOptions_progress___block_invoke_2;
  v7[3] = &unk_1E842CE30;
  v4 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 72);
  v10 = *(_OWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v4;
  v7[4] = v5;
  v12 = *(_OWORD *)(a1 + 80);
  v8 = v6;
  objc_msgSend(v3, "enumeratePersonNodesIncludingMe:withBlock:", 1, v7);

}

void __89__PGRecentPersonCentricSuggester_birthdayPersonPotentialSuggestionsWithOptions_progress___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  double Current;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  PGPotentialRecentPersonCentricSuggestion *v13;

  v5 = a2;
  if (*(_QWORD *)(a1 + 48)
    && (Current = CFAbsoluteTimeGetCurrent(),
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8),
        Current - *(double *)(v7 + 24) >= *(double *)(a1 + 72))
    && (*(double *)(v7 + 24) = Current,
        (*(void (**)(double))(*(_QWORD *)(a1 + 48) + 16))(0.75),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                               + 24)) != 0))
  {
    *a3 = 1;
  }
  else
  {
    objc_msgSend(v5, "localIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "containsObject:", v8) & 1) == 0)
      {
        objc_msgSend(v5, "birthdayDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9
          || (objc_msgSend(v5, "potentialBirthdayDate"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v11 = objc_msgSend(MEMORY[0x1E0D4B130], "monthFromDate:", v9);
            v12 = objc_msgSend(MEMORY[0x1E0D4B130], "dayFromDate:", v9);
            if (v11 == *(_QWORD *)(a1 + 80) && v12 == *(_QWORD *)(a1 + 88))
            {
              v13 = -[PGPotentialRecentPersonCentricSuggestion initWithPersonLocalIdentifier:assets:relationshipScore:]([PGPotentialRecentPersonCentricSuggestion alloc], "initWithPersonLocalIdentifier:assets:relationshipScore:", v8, v10, objc_msgSend(*(id *)(a1 + 32), "relationScoreWithPersonNode:", v5));
              objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);

            }
          }

        }
      }
    }

  }
}

void __84__PGRecentPersonCentricSuggester_assetsByPersonLocalIdentifierWithOptions_progress___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.8);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __66__PGRecentPersonCentricSuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 64) + *(double *)(a1 + 72) * a3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __61__PGRecentPersonCentricSuggester_nextSuggestionWithProgress___block_invoke(uint64_t a1, _BYTE *a2)
{
  double Current;
  uint64_t v5;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v5 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v5 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __61__PGRecentPersonCentricSuggester_nextSuggestionWithProgress___block_invoke_169(uint64_t a1, _BYTE *a2)
{
  double Current;
  uint64_t v5;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v5 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v5 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __77__PGRecentPersonCentricSuggester_suggestionWithPotentialSuggestion_progress___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  id v9;
  double Current;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  char v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  if (*(_QWORD *)(a1 + 40)
    && (Current = CFAbsoluteTimeGetCurrent(),
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8),
        Current - *(double *)(v11 + 24) >= *(double *)(a1 + 96))
    && (*(double *)(v11 + 24) = Current,
        v32 = 0,
        (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                                 + 24)
                                                                     * 0.6 + 0.2),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                               + 24)) != 0))
  {
    *a4 = 1;
  }
  else
  {
    obj = a2;
    v12 = v8;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(double *)(a1 + 104)
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 24);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v18, "personLocalIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", *(_QWORD *)(a1 + 32));

          if (v20)
          {
            objc_msgSend(v18, "quality");
            v22 = v21;
            objc_msgSend(v18, "size");
            v24 = v23;
            v25 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
            v8 = v12;
            if (v22 > v25
              || v22 == v25
              && ((v26 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), v24 > v26)
               || v24 == v26
               && objc_msgSend(v12, "compare:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40)) == -1))
            {
              objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), obj);
              *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v22;
              *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v24;
            }

            goto LABEL_19;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v15)
          continue;
        break;
      }
    }

    v8 = v12;
  }
LABEL_19:

}

void __70__PGRecentPersonCentricSuggester_nextPotentialSuggestionWithProgress___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.33);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __70__PGRecentPersonCentricSuggester_nextPotentialSuggestionWithProgress___block_invoke_155(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.33 + 0.33);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __70__PGRecentPersonCentricSuggester_nextPotentialSuggestionWithProgress___block_invoke_156(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.33 + 0.66);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __61__PGRecentPersonCentricSuggester_startSuggestingWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "graph");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "meNodeWithFallbackInferredMeNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addObject:", v4);

}

@end
