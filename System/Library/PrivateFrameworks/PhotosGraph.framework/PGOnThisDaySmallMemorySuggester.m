@implementation PGOnThisDaySmallMemorySuggester

+ (NSIndexSet)suggestionTypes
{
  return (NSIndexSet *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 4);
}

+ (NSIndexSet)suggestionSubtypes
{
  return (NSIndexSet *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 401);
}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  NSDictionary *v14;
  NSDictionary *momentByMomentLocalIdentifier;
  id v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  double Current;
  char v23;
  char v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *p_buf;
  uint64_t *v31;
  uint64_t v32;
  double v33;
  unint64_t v34;
  uint64_t v35;
  double *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  int v43;
  int v44;
  __int16 v45;
  const char *v46;
  uint64_t buf;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _Block_copy(v7);
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v35 = 0;
  v36 = (double *)&v35;
  v37 = 0x2020000000;
  v38 = 0;
  if (!v8
    || (v9 = CFAbsoluteTimeGetCurrent(), v9 - v36[3] < 0.01)
    || (v36[3] = v9,
        LOBYTE(v43) = 0,
        (*((void (**)(void *, int *, double))v8 + 2))(v8, &v43, 0.0),
        v10 = *((_BYTE *)v40 + 24) | v43,
        (*((_BYTE *)v40 + 24) = v10) == 0))
  {
    objc_msgSend(v6, "localToday");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGOnThisDaySmallMemorySuggester sortedMomentLocalIdentifiersWithDateIgnoringYearBeforeDateYear:](self, "sortedMomentLocalIdentifiersWithDateIgnoringYearBeforeDateYear:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGOnThisDaySmallMemorySuggester momentByMomentLocalIdentifierWithMomentLocalIdentifiers:](self, "momentByMomentLocalIdentifierWithMomentLocalIdentifiers:", v13);
    v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    momentByMomentLocalIdentifier = self->_momentByMomentLocalIdentifier;
    self->_momentByMomentLocalIdentifier = v14;

    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = objc_msgSend(v6, "maximumNumberOfSuggestions");
    if (v17)
      v18 = v17;
    else
      v18 = -1;
    buf = 0;
    *(_QWORD *)&v48 = &buf;
    *((_QWORD *)&v48 + 1) = 0x2020000000;
    v49 = 0;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __67__PGOnThisDaySmallMemorySuggester_suggestionsWithOptions_progress___block_invoke;
    v26[3] = &unk_1E8434048;
    v19 = v8;
    v29 = &v35;
    p_buf = &buf;
    v31 = &v39;
    v32 = 0x3F847AE147AE147BLL;
    v28 = v19;
    v26[4] = self;
    v33 = 1.0 / (double)v18;
    v20 = v16;
    v27 = v20;
    v34 = v18;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v26);
    if (*((_BYTE *)v40 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v43 = 67109378;
        v44 = 84;
        v45 = 2080;
        v46 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGOnThisDaySmallMemorySuggester.m";
        v21 = MEMORY[0x1E0C81028];
LABEL_13:
        _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v43, 0x12u);
      }
    }
    else
    {
      if (!v8
        || (Current = CFAbsoluteTimeGetCurrent(), Current - v36[3] < 0.01)
        || (v36[3] = Current,
            v25 = 0,
            (*((void (**)(id, char *, double))v19 + 2))(v19, &v25, 1.0),
            v23 = *((_BYTE *)v40 + 24) | v25,
            (*((_BYTE *)v40 + 24) = v23) == 0))
      {
        v11 = v20;
        goto LABEL_21;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v43 = 67109378;
        v44 = 86;
        v45 = 2080;
        v46 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGOnThisDaySmallMemorySuggester.m";
        v21 = MEMORY[0x1E0C81028];
        goto LABEL_13;
      }
    }
    v11 = (id)MEMORY[0x1E0C9AA60];
LABEL_21:

    _Block_object_dispose(&buf, 8);
    goto LABEL_22;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    buf = 0x3D04000202;
    LOWORD(v48) = 2080;
    *(_QWORD *)((char *)&v48 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Suggestions/Suggesters/Single Asset Suggester/PGOnThisDaySmallMemorySuggester.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
  v11 = (id)MEMORY[0x1E0C9AA60];
LABEL_22:
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  return v11;
}

- (void)startSuggestingWithOptions:(id)a3
{
  PGSuggestionOptions *v4;
  void *v5;
  NSObject *v6;
  NSArray *suggestedMomentLocalIdentifiers;
  NSDictionary *momentByMomentLocalIdentifier;
  NSEnumerator *suggestedMomentLocalIdentifierEnumerator;
  PGSuggestionOptions *options;
  uint8_t v11[16];

  v4 = (PGSuggestionOptions *)a3;
  -[PGAbstractSuggester session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loggingConnection");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_DEFAULT, "On This Day: Starting suggesting", v11, 2u);
  }

  suggestedMomentLocalIdentifiers = self->_suggestedMomentLocalIdentifiers;
  self->_suggestedMomentLocalIdentifiers = 0;

  momentByMomentLocalIdentifier = self->_momentByMomentLocalIdentifier;
  self->_momentByMomentLocalIdentifier = 0;

  suggestedMomentLocalIdentifierEnumerator = self->_suggestedMomentLocalIdentifierEnumerator;
  self->_suggestedMomentLocalIdentifierEnumerator = 0;

  options = self->_options;
  self->_options = v4;

}

- (id)nextSuggestionWithProgress:(id)a3
{
  id v4;
  void (**v5)(void *, _BYTE *, double);
  double v6;
  double v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSArray *suggestedMomentLocalIdentifiers;
  void *v12;
  NSArray *v13;
  NSArray *v14;
  NSEnumerator *v15;
  NSEnumerator *suggestedMomentLocalIdentifierEnumerator;
  double Current;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  char v23;
  uint8_t buf[4];
  _DWORD v25[7];

  *(_QWORD *)&v25[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void (**)(void *, _BYTE *, double))_Block_copy(v4);
  v6 = 0.0;
  if (!v5 || (v7 = CFAbsoluteTimeGetCurrent(), v7 < 0.01))
  {
LABEL_8:
    -[PGAbstractSuggester session](self, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_DEFAULT, "On This Day: nextSuggestion", buf, 2u);
    }
    if (self->_suggestedMomentLocalIdentifierEnumerator)
    {
      if (!v5)
        goto LABEL_22;
    }
    else
    {
      suggestedMomentLocalIdentifiers = self->_suggestedMomentLocalIdentifiers;
      if (!suggestedMomentLocalIdentifiers)
      {
        -[PGSuggestionOptions localToday](self->_options, "localToday");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGOnThisDaySmallMemorySuggester sortedMomentLocalIdentifiersWithDateIgnoringYearBeforeDateYear:](self, "sortedMomentLocalIdentifiersWithDateIgnoringYearBeforeDateYear:", v12);
        v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v14 = self->_suggestedMomentLocalIdentifiers;
        self->_suggestedMomentLocalIdentifiers = v13;

        suggestedMomentLocalIdentifiers = self->_suggestedMomentLocalIdentifiers;
      }
      -[NSArray objectEnumerator](suggestedMomentLocalIdentifiers, "objectEnumerator");
      v15 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
      suggestedMomentLocalIdentifierEnumerator = self->_suggestedMomentLocalIdentifierEnumerator;
      self->_suggestedMomentLocalIdentifierEnumerator = v15;

      if (!v5)
        goto LABEL_22;
    }
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v6 >= 0.01)
    {
      v23 = 0;
      v5[2](v5, &v23, 0.5);
      if (v23)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v25[0] = 126;
          LOWORD(v25[1]) = 2080;
          *(_QWORD *)((char *)&v25[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis"
                                             "/PhotosGraph/Framework/Suggestions/Suggesters/Single Asset Suggester/PGOnTh"
                                             "isDaySmallMemorySuggester.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v8 = 0;
LABEL_45:

        goto LABEL_46;
      }
      v6 = Current;
    }
LABEL_22:
    v18 = 0;
    while (1)
    {
      v19 = v18;
      -[NSEnumerator nextObject](self->_suggestedMomentLocalIdentifierEnumerator, "nextObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        break;
      v20 = (void *)MEMORY[0x1CAA4EB2C]();
      if (v5)
      {
        v21 = CFAbsoluteTimeGetCurrent();
        if (v21 - v6 >= 0.01)
        {
          v23 = 0;
          v5[2](v5, &v23, 0.75);
          if (v23)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v25[0] = 132;
              LOWORD(v25[1]) = 2080;
              *(_QWORD *)((char *)&v25[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanal"
                                                 "ysis/PhotosGraph/Framework/Suggestions/Suggesters/Single Asset Suggeste"
                                                 "r/PGOnThisDaySmallMemorySuggester.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            objc_autoreleasePoolPop(v20);
            goto LABEL_43;
          }
          v6 = v21;
        }
      }
      -[PGOnThisDaySmallMemorySuggester suggestionWithMomentLocalIdentifier:](self, "suggestionWithMomentLocalIdentifier:", v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v20);
      if (v8)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          *(_QWORD *)v25 = v8;
          _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_DEFAULT, "On This Day: Suggesting %{private}@", buf, 0xCu);
        }
        goto LABEL_34;
      }
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_DEFAULT, "On This Day: Nothing to suggest", buf, 2u);
    }
    v18 = 0;
    v8 = 0;
LABEL_34:
    if (v5)
    {
      if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
      {
        v23 = 0;
        v5[2](v5, &v23, 0.0);
        if (v23)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v25[0] = 144;
            LOWORD(v25[1]) = 2080;
            *(_QWORD *)((char *)&v25[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalys"
                                               "is/PhotosGraph/Framework/Suggestions/Suggesters/Single Asset Suggester/PG"
                                               "OnThisDaySmallMemorySuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

LABEL_43:
          v8 = 0;
        }
      }
    }

    goto LABEL_45;
  }
  v23 = 0;
  v5[2](v5, &v23, 0.0);
  if (!v23)
  {
    v6 = v7;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v25[0] = 110;
    LOWORD(v25[1]) = 2080;
    *(_QWORD *)((char *)&v25[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Suggestions/Suggesters/Single Asset Suggester/PGOnThisDaySmallMemorySuggester.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v8 = 0;
LABEL_46:

  return v8;
}

- (void)reset
{
  void *v3;
  NSObject *v4;
  NSEnumerator *suggestedMomentLocalIdentifierEnumerator;
  uint8_t v6[16];

  -[PGAbstractSuggester session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loggingConnection");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CA237000, v4, OS_LOG_TYPE_DEFAULT, "On This Day: Resetting", v6, 2u);
  }

  suggestedMomentLocalIdentifierEnumerator = self->_suggestedMomentLocalIdentifierEnumerator;
  self->_suggestedMomentLocalIdentifierEnumerator = 0;

}

- (id)sortedMomentLocalIdentifiersWithDateIgnoringYearBeforeDateYear:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGAbstractSuggester session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loggingConnection");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_DEFAULT, "On This Day: Computing eligible moments", buf, 2u);
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __98__PGOnThisDaySmallMemorySuggester_sortedMomentLocalIdentifiersWithDateIgnoringYearBeforeDateYear___block_invoke;
  v19 = &unk_1E8435640;
  v20 = v4;
  v9 = v8;
  v21 = v9;
  v10 = v4;
  objc_msgSend(v7, "performSynchronousConcurrentGraphReadUsingBlock:", &v16);
  v11 = v6;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(v9, "count", v16, v17, v18, v19, v20);
    *(_DWORD *)buf = 134217984;
    v23 = v12;
    _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_DEFAULT, "On This Day: found %lu eligible moments", buf, 0xCu);
  }

  v13 = v21;
  v14 = v9;

  return v14;
}

- (id)momentByMomentLocalIdentifierWithMomentLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGAbstractSuggester session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithLocalIdentifiers:options:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v15, "localIdentifier", (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  return v9;
}

- (id)suggestionWithMomentLocalIdentifier:(id)a3
{
  NSDictionary *v4;
  NSDictionary *momentByMomentLocalIdentifier;
  void *v6;
  NSString *v7;
  NSString *titleDateMatchingTitleOnThisDay;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  PGSingleAssetSuggestion *v30;
  id v31;
  void *v32;
  __CFString *v33;
  void *v34;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NSObject *oslog;
  void *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint8_t buf[4];
  __CFString *v55;
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  v42 = a3;
  if (!self->_momentByMomentLocalIdentifier)
  {
    -[PGOnThisDaySmallMemorySuggester momentByMomentLocalIdentifierWithMomentLocalIdentifiers:](self, "momentByMomentLocalIdentifierWithMomentLocalIdentifiers:", self->_suggestedMomentLocalIdentifiers);
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    momentByMomentLocalIdentifier = self->_momentByMomentLocalIdentifier;
    self->_momentByMomentLocalIdentifier = v4;

  }
  if (!self->_titleDateMatchingTitleOnThisDay)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PGRelativeDateTitleOnThisDay"), CFSTR("PGRelativeDateTitleOnThisDay"), CFSTR("Localizable"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    titleDateMatchingTitleOnThisDay = self->_titleDateMatchingTitleOnThisDay;
    self->_titleDateMatchingTitleOnThisDay = v7;

  }
  -[NSDictionary objectForKeyedSubscript:](self->_momentByMomentLocalIdentifier, "objectForKeyedSubscript:", v42);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[PGAbstractSuggester session](self, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loggingConnection");
    oslog = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "workingContext");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "curationManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "curationContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__61440;
    v52 = __Block_byref_object_dispose__61441;
    v53 = 0;
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __71__PGOnThisDaySmallMemorySuggester_suggestionWithMomentLocalIdentifier___block_invoke;
    v43[3] = &unk_1E84340C0;
    v47 = &v48;
    v13 = v11;
    v44 = v13;
    v14 = v9;
    v45 = v14;
    v15 = v12;
    v46 = v15;
    objc_msgSend(v41, "performSynchronousConcurrentGraphReadUsingBlock:", v43);
    v38 = v13;
    v39 = v15;
    objc_msgSend(v13, "curatedKeyAssetForAssetCollection:curatedAssetCollection:options:criteria:curationContext:", v14, 0, 0, v49[5], v15);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      if (!-[__CFString isVideo](v16, "isVideo"))
        goto LABEL_11;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_DEFAULT, "On This Day: Picked key asset is a video, trying again with only images", buf, 2u);
      }
      objc_msgSend((id)objc_opt_class(), "noVideoPredicate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGAbstractSuggester defaultAssetFetchOptionsWithInternalPredicate:](self, "defaultAssetFetchOptionsWithInternalPredicate:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v14, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0CD13B8];
      objc_msgSend(v20, "fetchedObjects");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "photoLibrary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v22, &stru_1E8436F28, 0, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v38, "curatedKeyAssetForAssetCollection:curatedAssetCollection:options:criteria:curationContext:", v24, 0, 0, v49[5], v39);
      v25 = objc_claimAutoreleasedReturnValue();

      v17 = (__CFString *)v25;
      if (v25)
      {
LABEL_11:
        -[__CFString fetchPropertySetsIfNeeded](v17, "fetchPropertySetsIfNeeded");
        v26 = (void *)MEMORY[0x1E0CD1390];
        v56[0] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "curationContext");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "prefetchOnAssets:options:curationContext:", v27, 31, v28);

        if (-[PGAbstractSuggester assetIsValidForSuggesting:](self, "assetIsValidForSuggesting:", v17))
        {
          -[__CFString curationScore](v17, "curationScore");
          if (v29 > *MEMORY[0x1E0D77DE0])
          {
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v55 = v17;
              _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_DEFAULT, "On This Day: Picked key asset %@", buf, 0xCu);
            }
            v30 = -[PGSingleAssetSuggestion initWithType:subtype:asset:]([PGSingleAssetSuggestion alloc], "initWithType:subtype:asset:", 4, 401, v17);
            if (!v30)
              goto LABEL_24;
            v31 = objc_alloc(MEMORY[0x1E0CB3588]);
            -[__CFString cls_localDate](v17, "cls_localDate");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = (__CFString *)objc_msgSend(v31, "initWithStartDate:duration:", v32, 0.0);

            -[PGSingleAssetSuggestion setTitle:](v30, "setTitle:", self->_titleDateMatchingTitleOnThisDay);
            +[PGTimeTitleUtility timeTitleWithDateInterval:allowedFormats:](PGTimeTitleUtility, "timeTitleWithDateInterval:allowedFormats:", v33, 33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[PGSingleAssetSuggestion setSubtitle:](v30, "setSubtitle:", v34);

            -[PGSingleAssetSuggestion setRelevanceDurationInDays:](v30, "setRelevanceDurationInDays:", 1);
LABEL_23:

LABEL_24:
            _Block_object_dispose(&v48, 8);

            goto LABEL_25;
          }
          v36 = (void *)MEMORY[0x1E0CB3940];
          -[__CFString curationScore](v17, "curationScore");
          objc_msgSend(v36, "stringWithFormat:", CFSTR("Picked key asset %@ has too low a curation score %f"), v17, v37);
          v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_20:
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v55 = v33;
            _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_DEFAULT, "On This Day: %@", buf, 0xCu);
          }
          v30 = 0;
          goto LABEL_23;
        }

        v17 = 0;
      }
    }
    v33 = CFSTR("Failed picking a key asset");
    goto LABEL_20;
  }
  v30 = 0;
LABEL_25:

  return v30;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleDateMatchingTitleOnThisDay, 0);
  objc_storeStrong((id *)&self->_suggestedMomentLocalIdentifierEnumerator, 0);
  objc_storeStrong((id *)&self->_momentByMomentLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestedMomentLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

void __71__PGOnThisDaySmallMemorySuggester_suggestionWithMomentLocalIdentifier___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = (void *)a1[4];
  v4 = a1[5];
  objc_msgSend(a2, "graph");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "criteriaForKeyAssetCurationWithAssetCollection:graph:options:curationContext:", v4, v8, 0, a1[6]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __98__PGOnThisDaySmallMemorySuggester_sortedMomentLocalIdentifiersWithDateIgnoringYearBeforeDateYear___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  PGNeighborScoreComputer *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  PGNeighborScoreComputer *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  PGNeighborScoreComputer *v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  _BYTE v31[128];
  _QWORD v32[5];

  v32[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(PGNeighborScoreComputer);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "dateNodesIgnoringYearForLocalDate:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(MEMORY[0x1E0D4B130], "yearFromDate:", *(_QWORD *)(a1 + 32));
  v8 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __98__PGOnThisDaySmallMemorySuggester_sortedMomentLocalIdentifiersWithDateIgnoringYearBeforeDateYear___block_invoke_2;
  v28[3] = &unk_1E8434070;
  v30 = v7;
  v9 = v5;
  v29 = v9;
  objc_msgSend(v6, "enumerateNodesUsingBlock:", v28);
  v10 = (void *)MEMORY[0x1E0CB3928];
  v26[0] = v8;
  v26[1] = 3221225472;
  v26[2] = __98__PGOnThisDaySmallMemorySuggester_sortedMomentLocalIdentifiersWithDateIgnoringYearBeforeDateYear___block_invoke_4;
  v26[3] = &unk_1E8434098;
  v11 = v4;
  v27 = v11;
  objc_msgSend(v10, "sortDescriptorWithKey:ascending:comparator:", CFSTR("self"), 0, v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("contentScore"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v13;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("localIdentifier"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sortUsingDescriptors:", v15);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v16 = v9;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v20), "localIdentifier", (_QWORD)v22);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    }
    while (v18);
  }

}

void __98__PGOnThisDaySmallMemorySuggester_sortedMomentLocalIdentifiersWithDateIgnoringYearBeforeDateYear___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a2;
  if (objc_msgSend(v5, "year") < *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v5, "collection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "momentNodes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __98__PGOnThisDaySmallMemorySuggester_sortedMomentLocalIdentifiersWithDateIgnoringYearBeforeDateYear___block_invoke_3;
    v6[3] = &unk_1E8436408;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v4, "enumerateNodesUsingBlock:", v6);

  }
}

BOOL __98__PGOnThisDaySmallMemorySuggester_sortedMomentLocalIdentifiersWithDateIgnoringYearBeforeDateYear___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  int64_t v7;
  double v8;
  double v9;
  int64_t v10;
  uint64_t v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "neighborScoreWithMomentNode:", a2);
  v7 = +[PGGraphMomentNode breakoutOfRoutineTypeWithNeighborScore:](PGGraphMomentNode, "breakoutOfRoutineTypeWithNeighborScore:");
  objc_msgSend(*(id *)(a1 + 32), "neighborScoreWithMomentNode:", v6);
  v9 = v8;

  v10 = +[PGGraphMomentNode breakoutOfRoutineTypeWithNeighborScore:](PGGraphMomentNode, "breakoutOfRoutineTypeWithNeighborScore:", v9);
  if (v10 == 2)
    v11 = -1;
  else
    v11 = 0;
  if (v7 == 2)
    return v10 != 2;
  else
    return v11;
}

void __98__PGOnThisDaySmallMemorySuggester_sortedMomentLocalIdentifiersWithDateIgnoringYearBeforeDateYear___block_invoke_3(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "contentScore");
  if (v3 > *MEMORY[0x1E0D77DE0])
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __67__PGOnThisDaySmallMemorySuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  double Current;
  uint64_t v8;
  void *v9;

  v6 = a2;
  if (*(_QWORD *)(a1 + 48)
    && (Current = CFAbsoluteTimeGetCurrent(),
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8),
        Current - *(double *)(v8 + 24) >= *(double *)(a1 + 80))
    && (*(double *)(v8 + 24) = Current,
        (*(void (**)(double))(*(_QWORD *)(a1 + 48) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                 + 24)),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                               + 24)) != 0))
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "suggestionWithMomentLocalIdentifier:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(double *)(a1 + 88)
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                              + 24);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
      if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= *(_QWORD *)(a1 + 96))
        *a4 = 1;
    }

  }
}

@end
