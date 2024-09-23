@implementation PGRecentSocialGroupCentricSuggester

+ (NSIndexSet)suggestionTypes
{
  return (NSIndexSet *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 3);
}

+ (NSIndexSet)suggestionSubtypes
{
  return (NSIndexSet *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 305);
}

- (void)startSuggestingWithOptions:(id)a3
{
  PGSuggestionOptions *v4;
  void *v5;
  NSObject *v6;
  NSArray *allPotentialSuggestions;
  NSMutableSet *usedPotentialSuggestions;
  NSArray *longTimeNoSeeSocialGroupPotentialSuggestions;
  NSArray *socialGroupPotentialSuggestions;
  NSEnumerator *longTimeNoSeeSocialGroupPotentialSuggestionEnumerator;
  NSEnumerator *socialGroupPotentialSuggestionEnumerator;
  PGSuggestionOptions *options;
  uint8_t v14[16];

  v4 = (PGSuggestionOptions *)a3;
  -[PGAbstractSuggester session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loggingConnection");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_DEFAULT, "Recent SocialGroup Centric: Starting suggesting", v14, 2u);
  }

  allPotentialSuggestions = self->_allPotentialSuggestions;
  self->_allPotentialSuggestions = 0;

  usedPotentialSuggestions = self->_usedPotentialSuggestions;
  self->_usedPotentialSuggestions = 0;

  longTimeNoSeeSocialGroupPotentialSuggestions = self->_longTimeNoSeeSocialGroupPotentialSuggestions;
  self->_longTimeNoSeeSocialGroupPotentialSuggestions = 0;

  socialGroupPotentialSuggestions = self->_socialGroupPotentialSuggestions;
  self->_socialGroupPotentialSuggestions = 0;

  longTimeNoSeeSocialGroupPotentialSuggestionEnumerator = self->_longTimeNoSeeSocialGroupPotentialSuggestionEnumerator;
  self->_longTimeNoSeeSocialGroupPotentialSuggestionEnumerator = 0;

  socialGroupPotentialSuggestionEnumerator = self->_socialGroupPotentialSuggestionEnumerator;
  self->_socialGroupPotentialSuggestionEnumerator = 0;

  options = self->_options;
  self->_options = v4;

}

- (id)nextSuggestionWithProgress:(id)a3
{
  void (**v4)(void *, _BYTE *, double);
  double Current;
  char v6;
  PGPeopleCentricSuggestion *v7;
  void *v8;
  PGPeopleCentricSuggestion *v9;
  void *v10;
  double v11;
  char v12;
  int v13;
  void (**v14)(void *, _BYTE *, double);
  uint64_t v15;
  void *v16;
  NSObject *v17;
  double v18;
  char v19;
  void *v20;
  PGKeyAssetCurationOptions *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  char v32;
  id v34;
  void *v35;
  void *v36;
  NSObject *log;
  _QWORD v38[4];
  void (**v39)(void *, _BYTE *, double);
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  double *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint8_t buf[4];
  _BYTE v58[14];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v4 = (void (**)(void *, _BYTE *, double))_Block_copy(v34);
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v49 = 0;
  v50 = (double *)&v49;
  v51 = 0x2020000000;
  v52 = 0;
  if (v4)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v50[3] >= 0.01)
    {
      v50[3] = Current;
      v48 = 0;
      v4[2](v4, &v48, 0.0);
      v6 = *((_BYTE *)v54 + 24) | v48;
      *((_BYTE *)v54 + 24) = v6;
      if (v6)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v58 = 97;
          *(_WORD *)&v58[4] = 2080;
          *(_QWORD *)&v58[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Suggestions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v7 = 0;
        goto LABEL_67;
      }
    }
  }
  -[PGAbstractSuggester session](self, "session", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "workingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "curationManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "loggingConnection");
  log = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, log, OS_LOG_TYPE_DEFAULT, "Recent SocialGroup Centric: nextSuggestion", buf, 2u);
  }
  v9 = 0;
  do
  {
    if (v9)
      goto LABEL_54;
    v10 = (void *)MEMORY[0x1CAA4EB2C]();
    if (!v4
      || (v11 = CFAbsoluteTimeGetCurrent(), v11 - v50[3] < 0.01)
      || (v50[3] = v11,
          v48 = 0,
          v4[2](v4, &v48, 0.5),
          v12 = *((_BYTE *)v54 + 24) | v48,
          (*((_BYTE *)v54 + 24) = v12) == 0))
    {
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __66__PGRecentSocialGroupCentricSuggester_nextSuggestionWithProgress___block_invoke;
      v43[3] = &unk_1E8434F30;
      v14 = v4;
      v44 = v14;
      v45 = &v49;
      v47 = 0x3F847AE147AE147BLL;
      v46 = &v53;
      -[PGRecentSocialGroupCentricSuggester nextLongTimeNoSeeSocialGroupPotentialSuggestionWithProgress:](self, "nextLongTimeNoSeeSocialGroupPotentialSuggestionWithProgress:", v43);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (*((_BYTE *)v54 + 24))
      {
        v13 = 1;
        v17 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v58 = 112;
          *(_WORD *)&v58[4] = 2080;
          *(_QWORD *)&v58[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Suggestions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
          _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v9 = 0;
        goto LABEL_21;
      }
      if (!v15)
      {
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __66__PGRecentSocialGroupCentricSuggester_nextSuggestionWithProgress___block_invoke_129;
        v38[3] = &unk_1E8434F30;
        v39 = v14;
        v40 = &v49;
        v42 = 0x3F847AE147AE147BLL;
        v41 = &v53;
        -[PGRecentSocialGroupCentricSuggester nextLongTimeNoSeeSocialGroupPotentialSuggestionWithProgress:](self, "nextLongTimeNoSeeSocialGroupPotentialSuggestionWithProgress:", v38);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (*((_BYTE *)v54 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v58 = 119;
            *(_WORD *)&v58[4] = 2080;
            *(_QWORD *)&v58[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          goto LABEL_42;
        }

      }
      if (!v4
        || (v18 = CFAbsoluteTimeGetCurrent(), v18 - v50[3] < 0.01)
        || (v50[3] = v18,
            v48 = 0,
            v4[2](v14, &v48, 0.5),
            v19 = *((_BYTE *)v54 + 24) | v48,
            (*((_BYTE *)v54 + 24) = v19) == 0))
      {
        if (!v16)
        {
          v9 = 0;
          v13 = 3;
          goto LABEL_22;
        }
        objc_msgSend(v16, "personLocalIdentifiers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_alloc_init(PGKeyAssetCurationOptions);
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGKeyAssetCurationOptions setReferencePersonLocalIdentifiers:](v21, "setReferencePersonLocalIdentifiers:", v22);

        objc_msgSend(v16, "assets");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "bestAssetInAssets:options:", v23, v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v4
          && (v25 = CFAbsoluteTimeGetCurrent(), v25 - v50[3] >= 0.01)
          && (v50[3] = v25,
              v48 = 0,
              v4[2](v14, &v48, 0.5),
              v26 = *((_BYTE *)v54 + 24) | v48,
              (*((_BYTE *)v54 + 24) = v26) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v58 = 131;
            *(_WORD *)&v58[4] = 2080;
            *(_QWORD *)&v58[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v9 = 0;
          v13 = 1;
        }
        else
        {
          if (v24)
          {
            v9 = -[PGPeopleCentricSuggestion initWithPersonLocalIdentifiers:asset:]([PGPeopleCentricSuggestion alloc], "initWithPersonLocalIdentifiers:asset:", v20, v24);
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("PGPeopleTitleFormatGenericSocialGroup"), CFSTR("PGPeopleTitleFormatGenericSocialGroup"), CFSTR("Localizable"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[PGSingleAssetSuggestion setTitle:](v9, "setTitle:", v28);

            objc_msgSend(v24, "localCreationDate");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v29, 2, 0);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[PGSingleAssetSuggestion setSubtitle:](v9, "setSubtitle:", v30);

          }
          else
          {
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1CA237000, log, OS_LOG_TYPE_ERROR, "Recent SocialGroup Centric: bestAssetInAssets returned nil, cannot generate suggestion", buf, 2u);
            }
            v9 = 0;
          }
          v13 = 0;
        }

LABEL_21:
LABEL_22:

        goto LABEL_23;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v58 = 122;
        *(_WORD *)&v58[4] = 2080;
        *(_QWORD *)&v58[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
LABEL_42:
      v9 = 0;
      v13 = 1;
      goto LABEL_21;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v58 = 107;
      *(_WORD *)&v58[4] = 2080;
      *(_QWORD *)&v58[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Suggestions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v9 = 0;
    v13 = 1;
LABEL_23:
    objc_autoreleasePoolPop(v10);
  }
  while (!v13);
  if (v13 != 3)
  {
LABEL_61:
    v7 = 0;
    goto LABEL_66;
  }
  if (v9)
  {
LABEL_54:
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      *(_QWORD *)v58 = v9;
      _os_log_impl(&dword_1CA237000, log, OS_LOG_TYPE_DEFAULT, "Recent SocialGroup Centric: Suggesting %{private}@", buf, 0xCu);
    }
    if (v4)
      goto LABEL_57;
    goto LABEL_65;
  }
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, log, OS_LOG_TYPE_DEFAULT, "Recent SocialGroup Centric: Nothing to suggest", buf, 2u);
  }
  v9 = 0;
  if (!v4)
    goto LABEL_65;
LABEL_57:
  v31 = CFAbsoluteTimeGetCurrent();
  if (v31 - v50[3] >= 0.01)
  {
    v50[3] = v31;
    v48 = 0;
    v4[2](v4, &v48, 1.0);
    v32 = *((_BYTE *)v54 + 24) | v48;
    *((_BYTE *)v54 + 24) = v32;
    if (v32)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v58 = 161;
        *(_WORD *)&v58[4] = 2080;
        *(_QWORD *)&v58[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_61;
    }
  }
LABEL_65:
  v9 = v9;
  v7 = v9;
LABEL_66:

LABEL_67:
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

  return v7;
}

- (void)reset
{
  void *v3;
  NSObject *v4;
  NSEnumerator *longTimeNoSeeSocialGroupPotentialSuggestionEnumerator;
  NSEnumerator *socialGroupPotentialSuggestionEnumerator;
  uint8_t v7[16];

  -[PGAbstractSuggester session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loggingConnection");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1CA237000, v4, OS_LOG_TYPE_DEFAULT, "Recent SocialGroup Centric: Resetting", v7, 2u);
  }

  longTimeNoSeeSocialGroupPotentialSuggestionEnumerator = self->_longTimeNoSeeSocialGroupPotentialSuggestionEnumerator;
  self->_longTimeNoSeeSocialGroupPotentialSuggestionEnumerator = 0;

  socialGroupPotentialSuggestionEnumerator = self->_socialGroupPotentialSuggestionEnumerator;
  self->_socialGroupPotentialSuggestionEnumerator = 0;

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
      v46 = 176;
      v47 = 2080;
      v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestion"
            "s/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v9 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[PGRecentSocialGroupCentricSuggester startSuggestingWithOptions:](self, "startSuggestingWithOptions:", v28);
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
          v46 = 187;
          v47 = 2080;
          v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
          _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v19 = 1;
      }
      else
      {
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __71__PGRecentSocialGroupCentricSuggester_suggestionsWithOptions_progress___block_invoke;
        v29[3] = &unk_1E84311C8;
        v30 = v6;
        v31 = &v37;
        v34 = v14;
        v35 = 1.0 / (double)v13;
        v32 = &v41;
        v33 = 0x3F847AE147AE147BLL;
        -[PGRecentSocialGroupCentricSuggester nextSuggestionWithProgress:](self, "nextSuggestionWithProgress:", v29);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        if (*((_BYTE *)v42 + 24))
        {
          v19 = 1;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v46 = 192;
            v47 = 2080;
            v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
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
        v46 = 202;
        v47 = 2080;
        v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
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
  -[PGRecentSocialGroupCentricSuggester suggestionsWithOptions:progress:](self, "suggestionsWithOptions:progress:", v8, &__block_literal_global_20930);
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

- (id)longTimeNoSeeSocialGroupPotentialSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  id v6;
  double Current;
  char v8;
  NSObject *v9;
  double v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  void *v18;
  double v19;
  char v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  char v31;
  NSArray *v32;
  NSArray *allPotentialSuggestions;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  char v39;
  void *v41;
  id v42;
  NSArray *obj;
  id v44;
  PGRecentSocialGroupCentricSuggester *v45;
  void (**v46)(void *, _BYTE *, double);
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[4];
  void (**v52)(void *, _BYTE *, double);
  uint64_t *v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  double *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  _QWORD v65[2];
  uint8_t v66[128];
  uint8_t buf[4];
  int v68;
  __int16 v69;
  const char *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  v6 = a4;
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 0;
  v57 = 0;
  v58 = (double *)&v57;
  v59 = 0x2020000000;
  v60 = 0;
  v46 = (void (**)(void *, _BYTE *, double))_Block_copy(v6);
  v41 = v6;
  if (v46)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v58[3] >= 0.01)
    {
      v58[3] = Current;
      v56 = 0;
      v46[2](v46, &v56, 0.0);
      v8 = *((_BYTE *)v62 + 24) | v56;
      *((_BYTE *)v62 + 24) = v8;
      if (v8)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v68 = 233;
          v69 = 2080;
          v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
          v9 = MEMORY[0x1E0C81028];
LABEL_12:
          _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_37;
        }
        goto LABEL_37;
      }
    }
  }
  v45 = self;
  if (!self->_allPotentialSuggestions)
  {
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __104__PGRecentSocialGroupCentricSuggester_longTimeNoSeeSocialGroupPotentialSuggestionsWithOptions_progress___block_invoke;
    v51[3] = &unk_1E8434F30;
    v52 = v46;
    v53 = &v57;
    v54 = &v61;
    v55 = 0x3F847AE147AE147BLL;
    -[PGRecentSocialGroupCentricSuggester potentialSuggestionsWithOptions:progress:](self, "potentialSuggestionsWithOptions:progress:", v44, v51, v6);
    v32 = (NSArray *)objc_claimAutoreleasedReturnValue();
    allPotentialSuggestions = self->_allPotentialSuggestions;
    self->_allPotentialSuggestions = v32;

    if (*((_BYTE *)v62 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v68 = 240;
        v69 = 2080;
        v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }

      goto LABEL_37;
    }

  }
  if (v46)
  {
    v10 = CFAbsoluteTimeGetCurrent();
    if (v10 - v58[3] >= 0.01)
    {
      v58[3] = v10;
      v56 = 0;
      v46[2](v46, &v56, 0.3);
      v11 = *((_BYTE *)v62 + 24) | v56;
      *((_BYTE *)v62 + 24) = v11;
      if (v11)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v68 = 243;
          v69 = 2080;
          v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
          v9 = MEMORY[0x1E0C81028];
          goto LABEL_12;
        }
LABEL_37:
        v34 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_51;
      }
    }
  }
  v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = -[NSArray count](self->_allPotentialSuggestions, "count");
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = self->_allPotentialSuggestions;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v66, 16);
  if (v13)
  {
    v14 = 1.0 / (double)v12;
    v15 = *(_QWORD *)v48;
    v16 = 0.0;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v48 != v15)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        if (v46)
        {
          v19 = CFAbsoluteTimeGetCurrent();
          if (v19 - v58[3] >= 0.01)
          {
            v58[3] = v19;
            v56 = 0;
            v46[2](v46, &v56, v16 * 0.6 + 0.3);
            v20 = *((_BYTE *)v62 + 24) | v56;
            *((_BYTE *)v62 + 24) = v20;
            if (v20)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                v68 = 250;
                v69 = 2080;
                v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Suggestions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              goto LABEL_41;
            }
          }
        }
        if ((-[NSMutableSet containsObject:](self->_usedPotentialSuggestions, "containsObject:", v18, v41) & 1) == 0)
        {
          objc_msgSend(v18, "notSeenSinceDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21 == 0;

          self = v45;
          if (!v22)
          {
            v23 = (void *)MEMORY[0x1CAA4EB2C]();
            objc_msgSend(v44, "additionalOptions");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("assetUUID"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v18, "personLocalIdentifiers");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "universalStartDate");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "universalEndDate");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[PGRecentSocialGroupCentricSuggester assetsMatchingSocialGroup:betweenStartDate:andEndDate:matchingAssetUUID:](v45, "assetsMatchingSocialGroup:betweenStartDate:andEndDate:matchingAssetUUID:", v26, v27, v28, v25);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v29, "count"))
            {
              objc_msgSend(v18, "setAssets:", v29);
              objc_msgSend(v42, "addObject:", v18);
            }

            objc_autoreleasePoolPop(v23);
            self = v45;
          }
        }
        v16 = v14 + v16;
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v66, 16);
      if (v13)
        continue;
      break;
    }
  }

  if (v46
    && (v30 = CFAbsoluteTimeGetCurrent(), v30 - v58[3] >= 0.01)
    && (v58[3] = v30,
        v56 = 0,
        v46[2](v46, &v56, 0.9),
        v31 = *((_BYTE *)v62 + 24) | v56,
        (*((_BYTE *)v62 + 24) = v31) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v68 = 273;
      v69 = 2080;
      v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestion"
            "s/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
LABEL_41:
    v34 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("notSeenSinceDate"), 1, v41);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v35;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("assets.@count"), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v65[1] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v42, "sortUsingDescriptors:", v37);
    if (v46
      && (v38 = CFAbsoluteTimeGetCurrent(), v38 - v58[3] >= 0.01)
      && (v58[3] = v38,
          v56 = 0,
          v46[2](v46, &v56, 1.0),
          v39 = *((_BYTE *)v62 + 24) | v56,
          (*((_BYTE *)v62 + 24) = v39) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v68 = 280;
        v69 = 2080;
        v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v34 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v34 = v42;
    }

  }
LABEL_51:
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);

  return v34;
}

- (id)socialGroupPotentialSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  id v6;
  double Current;
  char v8;
  NSObject *v9;
  double v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  void *v18;
  double v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  char v29;
  NSArray *v30;
  NSArray *allPotentialSuggestions;
  id v32;
  void *v33;
  void *v34;
  double v35;
  char v36;
  void *v38;
  id v39;
  NSArray *obj;
  PGRecentSocialGroupCentricSuggester *v41;
  void (**v42)(void *, _BYTE *, double);
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  void (**v49)(void *, _BYTE *, double);
  uint64_t *v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  double *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  void *v62;
  uint8_t v63[128];
  uint8_t buf[4];
  int v65;
  __int16 v66;
  const char *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v6 = a4;
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 0;
  v54 = 0;
  v55 = (double *)&v54;
  v56 = 0x2020000000;
  v57 = 0;
  v42 = (void (**)(void *, _BYTE *, double))_Block_copy(v6);
  v38 = v6;
  if (v42)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v55[3] >= 0.01)
    {
      v55[3] = Current;
      v53 = 0;
      v42[2](v42, &v53, 0.0);
      v8 = *((_BYTE *)v59 + 24) | v53;
      *((_BYTE *)v59 + 24) = v8;
      if (v8)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v65 = 288;
          v66 = 2080;
          v67 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
          v9 = MEMORY[0x1E0C81028];
LABEL_12:
          _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_36;
        }
        goto LABEL_36;
      }
    }
  }
  v41 = self;
  if (!self->_allPotentialSuggestions)
  {
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __91__PGRecentSocialGroupCentricSuggester_socialGroupPotentialSuggestionsWithOptions_progress___block_invoke;
    v48[3] = &unk_1E8434F30;
    v49 = v42;
    v50 = &v54;
    v51 = &v58;
    v52 = 0x3F847AE147AE147BLL;
    -[PGRecentSocialGroupCentricSuggester potentialSuggestionsWithOptions:progress:](self, "potentialSuggestionsWithOptions:progress:", v43, v48, v6);
    v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
    allPotentialSuggestions = self->_allPotentialSuggestions;
    self->_allPotentialSuggestions = v30;

    if (*((_BYTE *)v59 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v65 = 295;
        v66 = 2080;
        v67 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }

      goto LABEL_36;
    }

  }
  if (v42)
  {
    v10 = CFAbsoluteTimeGetCurrent();
    if (v10 - v55[3] >= 0.01)
    {
      v55[3] = v10;
      v53 = 0;
      v42[2](v42, &v53, 0.3);
      v11 = *((_BYTE *)v59 + 24) | v53;
      *((_BYTE *)v59 + 24) = v11;
      if (v11)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v65 = 298;
          v66 = 2080;
          v67 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
          v9 = MEMORY[0x1E0C81028];
          goto LABEL_12;
        }
LABEL_36:
        v32 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_50;
      }
    }
  }
  v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = -[NSArray count](self->_allPotentialSuggestions, "count");
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = self->_allPotentialSuggestions;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v63, 16);
  if (v13)
  {
    v14 = 1.0 / (double)v12;
    v15 = *(_QWORD *)v45;
    v16 = 0.0;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v45 != v15)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        if (v42)
        {
          v19 = CFAbsoluteTimeGetCurrent();
          if (v19 - v55[3] >= 0.01)
          {
            v55[3] = v19;
            v53 = 0;
            v42[2](v42, &v53, v16 * 0.6 + 0.3);
            v20 = *((_BYTE *)v59 + 24) | v53;
            *((_BYTE *)v59 + 24) = v20;
            if (v20)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                v65 = 305;
                v66 = 2080;
                v67 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Suggestions/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              goto LABEL_40;
            }
          }
        }
        if ((-[NSMutableSet containsObject:](self->_usedPotentialSuggestions, "containsObject:", v18, v38) & 1) == 0)
        {
          v21 = (void *)MEMORY[0x1CAA4EB2C]();
          objc_msgSend(v43, "additionalOptions");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("assetUUID"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "personLocalIdentifiers");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "universalStartDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "universalEndDate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGRecentSocialGroupCentricSuggester assetsMatchingSocialGroup:betweenStartDate:andEndDate:matchingAssetUUID:](v41, "assetsMatchingSocialGroup:betweenStartDate:andEndDate:matchingAssetUUID:", v24, v25, v26, v23);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v27, "count"))
          {
            objc_msgSend(v18, "setAssets:", v27);
            objc_msgSend(v39, "addObject:", v18);
          }

          objc_autoreleasePoolPop(v21);
          self = v41;
        }
        v16 = v14 + v16;
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v63, 16);
      if (v13)
        continue;
      break;
    }
  }

  if (v42
    && (v28 = CFAbsoluteTimeGetCurrent(), v28 - v55[3] >= 0.01)
    && (v55[3] = v28,
        v53 = 0,
        v42[2](v42, &v53, 0.9),
        v29 = *((_BYTE *)v59 + 24) | v53,
        (*((_BYTE *)v59 + 24) = v29) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v65 = 325;
      v66 = 2080;
      v67 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestion"
            "s/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
LABEL_40:
    v32 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("assets.@count"), 0, v38);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "sortUsingDescriptors:", v34);
    if (v42
      && (v35 = CFAbsoluteTimeGetCurrent(), v35 - v55[3] >= 0.01)
      && (v55[3] = v35,
          v53 = 0,
          v42[2](v42, &v53, 1.0),
          v36 = *((_BYTE *)v59 + 24) | v53,
          (*((_BYTE *)v59 + 24) = v36) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v65 = 331;
        v66 = 2080;
        v67 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentSocialGroupCentricSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v32 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v32 = v39;
    }

  }
LABEL_50:
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);

  return v32;
}

- (id)nextLongTimeNoSeeSocialGroupPotentialSuggestionWithProgress:(id)a3
{
  id v4;
  NSEnumerator *longTimeNoSeeSocialGroupPotentialSuggestionEnumerator;
  NSArray *longTimeNoSeeSocialGroupPotentialSuggestions;
  NSArray *v7;
  NSArray *v8;
  NSEnumerator *v9;
  NSEnumerator *v10;
  void *v11;

  v4 = a3;
  longTimeNoSeeSocialGroupPotentialSuggestionEnumerator = self->_longTimeNoSeeSocialGroupPotentialSuggestionEnumerator;
  if (!longTimeNoSeeSocialGroupPotentialSuggestionEnumerator)
  {
    longTimeNoSeeSocialGroupPotentialSuggestions = self->_longTimeNoSeeSocialGroupPotentialSuggestions;
    if (!longTimeNoSeeSocialGroupPotentialSuggestions)
    {
      -[PGRecentSocialGroupCentricSuggester longTimeNoSeeSocialGroupPotentialSuggestionsWithOptions:progress:](self, "longTimeNoSeeSocialGroupPotentialSuggestionsWithOptions:progress:", self->_options, v4);
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v8 = self->_longTimeNoSeeSocialGroupPotentialSuggestions;
      self->_longTimeNoSeeSocialGroupPotentialSuggestions = v7;

      -[PGRecentSocialGroupCentricSuggester usePotentialSuggestions:](self, "usePotentialSuggestions:", self->_longTimeNoSeeSocialGroupPotentialSuggestions);
      longTimeNoSeeSocialGroupPotentialSuggestions = self->_longTimeNoSeeSocialGroupPotentialSuggestions;
    }
    -[NSArray objectEnumerator](longTimeNoSeeSocialGroupPotentialSuggestions, "objectEnumerator");
    v9 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
    v10 = self->_longTimeNoSeeSocialGroupPotentialSuggestionEnumerator;
    self->_longTimeNoSeeSocialGroupPotentialSuggestionEnumerator = v9;

    longTimeNoSeeSocialGroupPotentialSuggestionEnumerator = self->_longTimeNoSeeSocialGroupPotentialSuggestionEnumerator;
  }
  -[NSEnumerator nextObject](longTimeNoSeeSocialGroupPotentialSuggestionEnumerator, "nextObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)nextSocialGroupPotentialSuggestionWithProgress:(id)a3
{
  id v4;
  NSEnumerator *socialGroupPotentialSuggestionEnumerator;
  NSArray *socialGroupPotentialSuggestions;
  NSArray *v7;
  NSArray *v8;
  NSEnumerator *v9;
  NSEnumerator *v10;
  void *v11;

  v4 = a3;
  socialGroupPotentialSuggestionEnumerator = self->_socialGroupPotentialSuggestionEnumerator;
  if (!socialGroupPotentialSuggestionEnumerator)
  {
    socialGroupPotentialSuggestions = self->_socialGroupPotentialSuggestions;
    if (!socialGroupPotentialSuggestions)
    {
      -[PGRecentSocialGroupCentricSuggester socialGroupPotentialSuggestionsWithOptions:progress:](self, "socialGroupPotentialSuggestionsWithOptions:progress:", self->_options, v4);
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v8 = self->_socialGroupPotentialSuggestions;
      self->_socialGroupPotentialSuggestions = v7;

      -[PGRecentSocialGroupCentricSuggester usePotentialSuggestions:](self, "usePotentialSuggestions:", self->_socialGroupPotentialSuggestions);
      socialGroupPotentialSuggestions = self->_socialGroupPotentialSuggestions;
    }
    -[NSArray objectEnumerator](socialGroupPotentialSuggestions, "objectEnumerator");
    v9 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
    v10 = self->_socialGroupPotentialSuggestionEnumerator;
    self->_socialGroupPotentialSuggestionEnumerator = v9;

    socialGroupPotentialSuggestionEnumerator = self->_socialGroupPotentialSuggestionEnumerator;
  }
  -[NSEnumerator nextObject](socialGroupPotentialSuggestionEnumerator, "nextObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)potentialSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PGAbstractSuggester session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__PGRecentSocialGroupCentricSuggester_potentialSuggestionsWithOptions_progress___block_invoke;
  v14[3] = &unk_1E8435640;
  v15 = v5;
  v9 = v6;
  v16 = v9;
  v10 = v5;
  objc_msgSend(v8, "performSynchronousConcurrentGraphReadUsingBlock:", v14);

  v11 = v16;
  v12 = v9;

  return v12;
}

- (id)verifiedPersons
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PGAbstractSuggester session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPersonContext:", 1);
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchedObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)assetsWithPersonsBetweenStartDate:(id)a3 andEndDate:(id)a4 matchAssetUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSArray *eligibleAssets;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSArray *v45;
  NSArray *v46;
  NSArray *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  unint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *context;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  eligibleAssets = self->_eligibleAssets;
  if (!eligibleAssets)
  {
    -[PGAbstractSuggester session](self, "session");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "photoLibrary");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(MEMORY[0x1E0CD1390], "clsPrefetchOptionsForKeyAsset");
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v54 = (void *)MEMORY[0x1CAA4EB2C]();
    objc_msgSend((id)objc_opt_class(), "noVideoPredicate");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v53, 0);
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dateCreated >= %@"), v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v14);

    }
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dateCreated <= %@"), v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v15);

    }
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid == %@"), v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v16);

    }
    v52 = v13;
    if ((unint64_t)objc_msgSend(v13, "count") <= 1)
      objc_msgSend(v13, "firstObject");
    else
      objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v13);
    v55 = v10;
    v56 = v9;
    v57 = v8;
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGAbstractSuggester defaultAssetFetchOptionsWithInternalPredicate:](self, "defaultAssetFetchOptionsWithInternalPredicate:", v51);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFetchPropertySets:", v18);

    objc_msgSend(v17, "setChunkSizeForFetch:", 500);
    -[PGRecentSocialGroupCentricSuggester verifiedPersons](self, "verifiedPersons");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v17;
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsForPersons:options:");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v59, "count");
    if (v19)
    {
      v20 = v19;
      v21 = 0;
      v58 = v19;
      do
      {
        context = (void *)MEMORY[0x1CAA4EB2C]();
        if (v20 - v21 >= 0x1F4)
          v22 = 500;
        else
          v22 = v20 - v21;
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "objectsAtIndexes:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = objc_alloc(MEMORY[0x1E0CD1620]);
        objc_msgSend(v59, "fetchType");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "fetchPropertySets");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v25, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v24, v61, v26, v27, 0, 0);

        v29 = (void *)MEMORY[0x1E0CD1390];
        objc_msgSend(v62, "curationContext");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "clsAllAssetsFromFetchResult:prefetchOptions:curationContext:", v28, v60, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v32 = v31;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v65;
          do
          {
            for (i = 0; i != v34; ++i)
            {
              if (*(_QWORD *)v65 != v35)
                objc_enumerationMutation(v32);
              v37 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
              if (-[PGAbstractSuggester assetIsValidForSuggesting:](self, "assetIsValidForSuggesting:", v37))
              {
                objc_msgSend(v37, "uuid");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "addObject:", v38);

              }
            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
          }
          while (v34);
        }

        objc_autoreleasePoolPop(context);
        v21 += 500;
        v20 = v58;
      }
      while (v21 < v58);
    }

    objc_autoreleasePoolPop(v54);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v12);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGAbstractSuggester defaultAssetFetchOptionsWithInternalPredicate:](self, "defaultAssetFetchOptionsWithInternalPredicate:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setFetchPropertySets:", v41);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(v62, "curationContext");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "clsAllAssetsFromFetchResult:prefetchOptions:curationContext:", v42, v60, v44);
    v45 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v46 = self->_eligibleAssets;
    self->_eligibleAssets = v45;

    eligibleAssets = self->_eligibleAssets;
    v9 = v56;
    v8 = v57;
    v10 = v55;
  }
  v47 = eligibleAssets;

  return v47;
}

- (id)assetsMatchingSocialGroup:(id)a3 betweenStartDate:(id)a4 andEndDate:(id)a5 matchingAssetUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  BOOL (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  unint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  -[PGAbstractSuggester session](self, "session");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "loggingConnection");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v33 = (uint64_t)v10;
    v34 = 2112;
    v35 = v11;
    _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_DEFAULT, "Recent SocialGroup Centric: Computing eligible socialgroup assets between %@ and %@", buf, 0x16u);
  }
  -[PGRecentSocialGroupCentricSuggester assetsWithPersonsBetweenStartDate:andEndDate:matchAssetUUID:](self, "assetsWithPersonsBetweenStartDate:andEndDate:matchAssetUUID:", v10, v11, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v13, "count");

  v19 = (void *)MEMORY[0x1E0CB3880];
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __111__PGRecentSocialGroupCentricSuggester_assetsMatchingSocialGroup_betweenStartDate_andEndDate_matchingAssetUUID___block_invoke;
  v29 = &unk_1E842ADE8;
  v30 = v17;
  v31 = v18 >> 1;
  v20 = v17;
  objc_msgSend(v19, "predicateWithBlock:", &v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "filteredArrayUsingPredicate:", v21, v26, v27, v28, v29);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v15;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = objc_msgSend(v22, "count");
    *(_DWORD *)buf = 134217984;
    v33 = v24;
    _os_log_impl(&dword_1CA237000, v23, OS_LOG_TYPE_DEFAULT, "Recent SocialGroup Centric: found %lu eligible assets", buf, 0xCu);
  }

  return v22;
}

- (void)usePotentialSuggestions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableSet addObject:](self->_usedPotentialSuggestions, "addObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eligibleAssets, 0);
  objc_storeStrong((id *)&self->_socialGroupPotentialSuggestionEnumerator, 0);
  objc_storeStrong((id *)&self->_longTimeNoSeeSocialGroupPotentialSuggestionEnumerator, 0);
  objc_storeStrong((id *)&self->_socialGroupPotentialSuggestions, 0);
  objc_storeStrong((id *)&self->_longTimeNoSeeSocialGroupPotentialSuggestions, 0);
  objc_storeStrong((id *)&self->_usedPotentialSuggestions, 0);
  objc_storeStrong((id *)&self->_allPotentialSuggestions, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

BOOL __111__PGRecentSocialGroupCentricSuggester_assetsMatchingSocialGroup_betweenStartDate_andEndDate_matchingAssetUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL8 v8;
  void *v9;
  unsigned int v10;
  unint64_t v11;

  v3 = a2;
  objc_msgSend(v3, "clsPersonLocalIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intersectSet:", *(_QWORD *)(a1 + 32));
  v6 = objc_msgSend(v5, "count");
  if (v6 >= 2 && (v7 = v6, v6 >= *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(v3, "clsFaceInformationSummary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "numberOfFaces");
    v11 = v10 - v7;
    if (v10 < v7)
      v11 = 0;
    v8 = v11 < v7 && (double)v7 * 0.5 <= (double)objc_msgSend(v9, "numberOfGoodFacesOfVerifiedPersons");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __80__PGRecentSocialGroupCentricSuggester_potentialSuggestionsWithOptions_progress___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "universalStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "universalEndDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__PGRecentSocialGroupCentricSuggester_potentialSuggestionsWithOptions_progress___block_invoke_2;
  v8[3] = &unk_1E842ADC0;
  v9 = v5;
  v10 = v4;
  v11 = *(id *)(a1 + 40);
  v6 = v4;
  v7 = v5;
  objc_msgSend(v3, "enumerateSocialGroupsWithBlock:includeInvalidGroups:", v8, 0);

}

void __80__PGRecentSocialGroupCentricSuggester_potentialSuggestionsWithOptions_progress___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, float a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  char v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  PGPotentialRecentSocialGroupCentricSuggestion *v40;
  double v41;
  PGPotentialRecentSocialGroupCentricSuggestion *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = (void *)MEMORY[0x1CAA4EB2C]();
  if ((unint64_t)objc_msgSend(v9, "count") >= 2)
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    if (v14)
    {
      v15 = v14;
      v43 = v12;
      v44 = v11;
      v45 = v10;
      v46 = v9;
      v16 = 0;
      v17 = 0;
      v18 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v56 != v18)
            objc_enumerationMutation(v13);
          v20 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_msgSend(v20, "universalStartDate", v43);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "compare:", *(_QWORD *)(a1 + 32)) == 1
            || (objc_msgSend(v20, "universalEndDate"),
                v22 = (void *)objc_claimAutoreleasedReturnValue(),
                v23 = objc_msgSend(v22, "compare:", *(_QWORD *)(a1 + 40)),
                v22,
                v23 == -1))
          {
            if (objc_msgSend(v21, "compare:", *(_QWORD *)(a1 + 40)) == -1)
            {
              if (v16)
              {
                objc_msgSend(v21, "laterDate:", v16);
                v24 = objc_claimAutoreleasedReturnValue();

                v16 = (id)v24;
              }
              else
              {
                v16 = v21;
              }
            }
          }
          else
          {
            v17 = 1;
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      }
      while (v15);

      if ((v17 & 1) == 0)
      {
        v10 = v45;
        v9 = v46;
        v12 = v43;
        v11 = v44;
        goto LABEL_38;
      }
      if (v16)
      {
        objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceDate:", v16);
        if (v25 <= 2592000.0)
        {

          v16 = 0;
        }
      }
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v46, "count"));
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v27 = v46;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v52;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v52 != v30)
              objc_enumerationMutation(v27);
            objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * j), "localIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObject:", v32);

          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
        }
        while (v29);
      }

      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v13, "count"));
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v34 = v13;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
      v11 = v44;
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v48;
        do
        {
          for (k = 0; k != v36; ++k)
          {
            if (*(_QWORD *)v48 != v37)
              objc_enumerationMutation(v34);
            objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * k), "localIdentifier");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "addObject:", v39);

          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
        }
        while (v36);
      }

      v40 = [PGPotentialRecentSocialGroupCentricSuggestion alloc];
      v10 = v45;
      *(float *)&v41 = a5;
      v42 = -[PGPotentialRecentSocialGroupCentricSuggestion initWithPersonLocalIdentifiers:personWeights:momentLocalIdentifiers:weight:notSeenSinceDate:](v40, "initWithPersonLocalIdentifiers:personWeights:momentLocalIdentifiers:weight:notSeenSinceDate:", v26, v45, v33, v16, v41);
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v42);

      v9 = v46;
      v12 = v43;
    }
    else
    {
      v16 = 0;
      v26 = v13;
    }

LABEL_38:
  }
  objc_autoreleasePoolPop(v12);

}

void __91__PGRecentSocialGroupCentricSuggester_socialGroupPotentialSuggestionsWithOptions_progress___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __104__PGRecentSocialGroupCentricSuggester_longTimeNoSeeSocialGroupPotentialSuggestionsWithOptions_progress___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __71__PGRecentSocialGroupCentricSuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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

void __66__PGRecentSocialGroupCentricSuggester_nextSuggestionWithProgress___block_invoke(uint64_t a1, _BYTE *a2)
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

void __66__PGRecentSocialGroupCentricSuggester_nextSuggestionWithProgress___block_invoke_129(uint64_t a1, _BYTE *a2)
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

@end
