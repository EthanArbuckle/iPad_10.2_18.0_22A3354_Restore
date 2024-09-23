@implementation TIStickerCandidateGenerator

- (void)clearCache
{
  void *v3;
  CAContext *context;

  -[NSCache removeAllObjects](self->_queryToUUID, "removeAllObjects");
  +[TIKeyboardSecureTouchManager sharedInstance](TIKeyboardSecureTouchManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearRegistrations");

  context = self->_context;
  self->_context = 0;

}

+ (TIStickerCandidateGenerator)sharedInstance
{
  if (sharedInstance_onceToken_12178 != -1)
    dispatch_once(&sharedInstance_onceToken_12178, &__block_literal_global_12179);
  return (TIStickerCandidateGenerator *)(id)sharedInstance___stickerCandidateGenerator;
}

- (TIStickerCandidateGenerator)init
{
  TIStickerCandidateGenerator *v2;
  NSCache *v3;
  NSCache *queryToUUID;
  TISceneTaxonomyGenerator *v5;
  TISceneTaxonomyGenerator *sceneTaxonomyGenerator;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIStickerCandidateGenerator;
  v2 = -[TIStickerCandidateGenerator init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    queryToUUID = v2->_queryToUUID;
    v2->_queryToUUID = v3;

    -[NSCache setTotalCostLimit:](v2->_queryToUUID, "setTotalCostLimit:", 100);
    v5 = objc_alloc_init(TISceneTaxonomyGenerator);
    sceneTaxonomyGenerator = v2->_sceneTaxonomyGenerator;
    v2->_sceneTaxonomyGenerator = v5;

    -[TIStickerCandidateGenerator createContext](v2, "createContext");
  }
  return v2;
}

- (void)generateStickerCandidatesForSearchableQueries:(id)a3 withRenderTraits:(id)a4 shouldAppend:(BOOL)a5 language:(id)a6 completionHandler:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  NSObject *v30;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  v18 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __134__TIStickerCandidateGenerator_generateStickerCandidatesForSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke;
  v28[3] = &unk_1EA102930;
  v19 = v16;
  v29 = v19;
  v20 = v17;
  v30 = v20;
  -[TIStickerCandidateGenerator _generateStickerCandidatesForTaxonomySearchableQueries:withRenderTraits:shouldAppend:language:completionHandler:](self, "_generateStickerCandidatesForTaxonomySearchableQueries:withRenderTraits:shouldAppend:language:completionHandler:", v12, v13, v9, v14, v28);
  if ((_os_feature_enabled_impl() & 1) != 0
    || (_os_feature_enabled_impl() & 1) != 0
    || _os_feature_enabled_impl())
  {
    dispatch_group_enter(v20);
    v25[0] = v18;
    v25[1] = 3221225472;
    v25[2] = __134__TIStickerCandidateGenerator_generateStickerCandidatesForSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_2;
    v25[3] = &unk_1EA102930;
    v26 = v19;
    v27 = v20;
    -[TIStickerCandidateGenerator _generateStickerCandidatesForGenerativeEmojiSearchableQueries:withRenderTraits:shouldAppend:language:completionHandler:](self, "_generateStickerCandidatesForGenerativeEmojiSearchableQueries:withRenderTraits:shouldAppend:language:completionHandler:", v12, v13, v9, v14, v25);

  }
  v24 = v15;
  v21 = v19;
  v22 = v15;
  v23 = v20;
  TIDispatchAsync();

}

- (void)_generateStickerCandidatesForTaxonomySearchableQueries:(id)a3 withRenderTraits:(id)a4 shouldAppend:(BOOL)a5 language:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  double Current;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  dispatch_time_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unsigned __int8 *v43;
  unsigned __int8 v44;
  uint64_t v45;
  id v46;
  id v47;
  TIStickerCandidateGenerator *v48;
  void *v49;
  id v50;
  void *v51;
  _QWORD block[4];
  id v53;
  uint64_t *v54;
  _QWORD v55[4];
  id v56;
  id v57;
  uint64_t *v58;
  int v59;
  _QWORD v60[5];
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  id v65;
  _QWORD *v66;
  uint64_t *v67;
  int v68;
  _QWORD v69[5];
  id v70;
  _QWORD v71[5];
  id v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  const char *v76;
  char v77;
  _QWORD aBlock[5];
  id v79;
  id v80;
  BOOL v81;
  _QWORD v82[3];

  v82[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __143__TIStickerCandidateGenerator__generateStickerCandidatesForTaxonomySearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke;
  aBlock[3] = &unk_1EA1029A8;
  v50 = v15;
  v80 = v50;
  v48 = self;
  aBlock[4] = self;
  v81 = a5;
  v46 = v13;
  v79 = v46;
  v51 = _Block_copy(aBlock);
  v73 = 0;
  v74 = &v73;
  v75 = 0x2810000000;
  v76 = "";
  v77 = 0;
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x1E0CA6B70], "emptySuggestion");
  v45 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA6B98], "userQueryContextWithCurrentSuggestion:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v14;
  v18 = v14;
  v19 = v12;
  objc_msgSend(v17, "setKeyboardLanguage:", v18);
  objc_msgSend(v17, "setBundleIDs:", &unk_1EA140048);
  objc_msgSend(v17, "setFetchAttributes:", &unk_1EA140060);
  v49 = v17;
  objc_msgSend(v17, "setMaxSuggestionCount:", 50);
  if (objc_msgSend(v12, "count"))
  {
    v20 = 0;
    v21 = Current + -5184000.0;
    while (1)
    {
      objc_msgSend(v19, "objectAtIndex:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "normalizedQueryString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCache objectForKey:](v48->_queryToUUID, "objectForKey:", v23);
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24)
        break;
      v25 = (void *)objc_msgSend(v49, "copy");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kMDItemLastUsedDate > %f && (kMDItemPhotosSceneClassificationLabels == \"%@\"cwd || kMDItemPhotosSceneClassificationSynonyms == \"%@\"cwd)"), *(_QWORD *)&v21, v23, v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v82[0] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setFilterQueries:", v27);

      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B90]), "initWithUserQueryString:userQueryContext:", v23, v25);
      v71[0] = 0;
      v71[1] = v71;
      v71[2] = 0x3032000000;
      v71[3] = __Block_byref_object_copy__12117;
      v71[4] = __Block_byref_object_dispose__12118;
      v72 = 0;
      v69[0] = 0;
      v69[1] = v69;
      v69[2] = 0x3032000000;
      v69[3] = __Block_byref_object_copy__12117;
      v69[4] = __Block_byref_object_dispose__12118;
      v70 = (id)objc_opt_new();
      v29 = MEMORY[0x1E0C809B0];
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __143__TIStickerCandidateGenerator__generateStickerCandidatesForTaxonomySearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_63;
      v61[3] = &unk_1EA1029D0;
      v66 = v69;
      v67 = &v73;
      v64 = v51;
      v62 = v22;
      v68 = v20;
      v30 = v19;
      v63 = v30;
      v31 = v19;
      v32 = v50;
      v65 = v32;
      v33 = v22;
      objc_msgSend(v28, "setFoundItemsHandler:", v61);
      v60[0] = v29;
      v60[1] = 3221225472;
      v60[2] = __143__TIStickerCandidateGenerator__generateStickerCandidatesForTaxonomySearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_2_74;
      v60[3] = &unk_1EA1029F8;
      v60[4] = v71;
      objc_msgSend(v28, "setFoundSuggestionsHandler:", v60);
      v55[0] = v29;
      v55[1] = 3221225472;
      v55[2] = __143__TIStickerCandidateGenerator__generateStickerCandidatesForTaxonomySearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_3;
      v55[3] = &unk_1EA102A20;
      v59 = v20;
      v34 = v30;
      v56 = v34;
      v58 = &v73;
      v35 = v32;
      v19 = v31;
      v57 = v35;
      objc_msgSend(v28, "setCompletionHandler:", v55);
      objc_msgSend(v28, "start");

      _Block_object_dispose(v69, 8);
      _Block_object_dispose(v71, 8);

      if (objc_msgSend(v34, "count") <= (unint64_t)++v20)
        goto LABEL_5;
    }
    v42 = (void *)v24;
    v36 = v19;
    v43 = (unsigned __int8 *)(v74 + 4);
    do
      v44 = __ldaxr(v43);
    while (__stlxr(1u, v43));
    v40 = v46;
    v39 = v47;
    v41 = (void *)v45;
    if ((v44 & 1) == 0)
      (*((void (**)(void *, uint64_t, void *))v51 + 2))(v51, v24, v22);

    v38 = v50;
  }
  else
  {
LABEL_5:
    v36 = v19;
    v37 = dispatch_time(0, 200000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __143__TIStickerCandidateGenerator__generateStickerCandidatesForTaxonomySearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_2_79;
    block[3] = &unk_1EA102A48;
    v54 = &v73;
    v38 = v50;
    v53 = v50;
    dispatch_after(v37, MEMORY[0x1E0C80D38], block);
    v22 = v53;
    v40 = v46;
    v39 = v47;
    v41 = (void *)v45;
  }

  _Block_object_dispose(&v73, 8);
}

- (void)_generateStickerCandidatesForGenerativeEmojiSearchableQueries:(id)a3 withRenderTraits:(id)a4 shouldAppend:(BOOL)a5 language:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  dispatch_time_t v31;
  void *v32;
  void *v33;
  unsigned __int8 *v34;
  unsigned __int8 v35;
  void *v36;
  id v37;
  void *v38;
  TIStickerCandidateGenerator *v39;
  void *v40;
  id v41;
  void *v42;
  _QWORD block[4];
  id v44;
  uint64_t *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint64_t *v49;
  int v50;
  _QWORD v51[5];
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  id v56;
  _QWORD *v57;
  uint64_t *v58;
  int v59;
  _QWORD v60[5];
  id v61;
  _QWORD v62[5];
  id v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  const char *v67;
  char v68;
  _QWORD aBlock[5];
  id v70;
  id v71;
  BOOL v72;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __150__TIStickerCandidateGenerator__generateStickerCandidatesForGenerativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke;
  aBlock[3] = &unk_1EA1029A8;
  v41 = v15;
  v71 = v41;
  v39 = self;
  aBlock[4] = self;
  v72 = a5;
  v16 = v13;
  v17 = v12;
  v37 = v16;
  v70 = v16;
  v42 = _Block_copy(aBlock);
  v64 = 0;
  v65 = &v64;
  v66 = 0x2810000000;
  v67 = "";
  v68 = 0;
  objc_msgSend(MEMORY[0x1E0CA6B70], "emptySuggestion");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA6B98], "userQueryContextWithCurrentSuggestion:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v14;
  objc_msgSend(v18, "setKeyboardLanguage:", v14);
  objc_msgSend(v18, "setBundleIDs:", &unk_1EA140078);
  objc_msgSend(v18, "setFetchAttributes:", &unk_1EA140090);
  v40 = v18;
  objc_msgSend(v18, "setMaxSuggestionCount:", 50);
  if (objc_msgSend(v12, "count"))
  {
    v19 = 0;
    while (1)
    {
      objc_msgSend(v17, "objectAtIndex:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "normalizedQueryString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCache objectForKey:](v39->_queryToUUID, "objectForKey:", v21);
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
        break;
      v23 = (void *)objc_msgSend(v40, "copy");
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B90]), "initWithUserQueryString:userQueryContext:", v21, v23);
      v62[0] = 0;
      v62[1] = v62;
      v62[2] = 0x3032000000;
      v62[3] = __Block_byref_object_copy__12117;
      v62[4] = __Block_byref_object_dispose__12118;
      v63 = 0;
      v60[0] = 0;
      v60[1] = v60;
      v60[2] = 0x3032000000;
      v60[3] = __Block_byref_object_copy__12117;
      v60[4] = __Block_byref_object_dispose__12118;
      v61 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v25 = MEMORY[0x1E0C809B0];
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __150__TIStickerCandidateGenerator__generateStickerCandidatesForGenerativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_90;
      v52[3] = &unk_1EA1029D0;
      v57 = v60;
      v58 = &v64;
      v55 = v42;
      v53 = v20;
      v59 = v19;
      v26 = v17;
      v54 = v26;
      v27 = v41;
      v56 = v27;
      v28 = v20;
      objc_msgSend(v24, "setFoundItemsHandler:", v52);
      v51[0] = v25;
      v51[1] = 3221225472;
      v51[2] = __150__TIStickerCandidateGenerator__generateStickerCandidatesForGenerativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_2_92;
      v51[3] = &unk_1EA1029F8;
      v51[4] = v62;
      objc_msgSend(v24, "setFoundSuggestionsHandler:", v51);
      v46[0] = v25;
      v46[1] = 3221225472;
      v46[2] = __150__TIStickerCandidateGenerator__generateStickerCandidatesForGenerativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_3;
      v46[3] = &unk_1EA102A20;
      v50 = v19;
      v29 = v26;
      v47 = v29;
      v49 = &v64;
      v48 = v27;
      objc_msgSend(v24, "setCompletionHandler:", v46);
      objc_msgSend(v24, "start");

      _Block_object_dispose(v60, 8);
      _Block_object_dispose(v62, 8);

      ++v19;
      v30 = v29;
      v17 = v12;
      if (objc_msgSend(v30, "count") <= v19)
        goto LABEL_5;
    }
    v33 = (void *)v22;
    v34 = (unsigned __int8 *)(v65 + 4);
    v32 = v41;
    do
      v35 = __ldaxr(v34);
    while (__stlxr(1u, v34));
    if ((v35 & 1) == 0)
      (*((void (**)(void *, uint64_t, void *))v42 + 2))(v42, v22, v20);

  }
  else
  {
LABEL_5:
    v31 = dispatch_time(0, 200000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __150__TIStickerCandidateGenerator__generateStickerCandidatesForGenerativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_2_94;
    block[3] = &unk_1EA102A48;
    v45 = &v64;
    v32 = v41;
    v44 = v41;
    dispatch_after(v31, MEMORY[0x1E0C80D38], block);
    v20 = v44;
  }

  _Block_object_dispose(&v64, 8);
}

- (void)createContext
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  CAContext *v8;
  CAContext *context;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C9AE50];
  v4 = *MEMORY[0x1E0CD2A28];
  v10[0] = *MEMORY[0x1E0CD2A40];
  v10[1] = v4;
  v5 = *MEMORY[0x1E0C9AE40];
  v11[0] = v3;
  v11[1] = v5;
  v6 = *MEMORY[0x1E0CD2A38];
  v10[2] = *MEMORY[0x1E0CD2A30];
  v10[3] = v6;
  v11[2] = v3;
  v11[3] = v3;
  v10[4] = *MEMORY[0x1E0CD2A10];
  v11[4] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2720], "remoteContextWithOptions:", v7);
  v8 = (CAContext *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  self->_context = v8;

}

- (id)generateStickerQueriesForText:(id)a3 tokenize:(BOOL)a4
{
  return -[TISceneTaxonomyGenerator generateSearchableQueriesForText:tokenize:](self->_sceneTaxonomyGenerator, "generateSearchableQueriesForText:tokenize:", a3, a4);
}

- (id)keyboardStickerWithIdentifier:(id)a3 roles:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  void *v29;
  char v30;
  uint64_t v31;
  void *v32;
  char v33;
  void *v34;
  char v35;
  void *v36;
  char v37;
  void *v38;
  int v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v55;
  uint64_t v56;
  TIStickerCandidateGenerator *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  NSObject *v63;
  id obj;
  uint64_t obja;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  uint8_t v72[128];
  uint8_t buf[4];
  void *v74;
  _QWORD v75[3];

  v75[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v75[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIStickerCandidateGenerator stickersForStickerIdentifiers:roles:](self, "stickersForStickerIdentifiers:roles:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0DACC60]);
    v71 = 0;
    objc_msgSend(v10, "touchStickerWithIdentifier:error:", v6, &v71);
    v11 = v71;
    if (v11)
    {
      TIStickerCandidateGeneratorOSLogFacility();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Error returned from touching sticker with identifier %@: %@."), "-[TIStickerCandidateGenerator keyboardStickerWithIdentifier:roles:]", v6, v11);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v74 = v55;
        _os_log_error_impl(&dword_1DA6F2000, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
      v13 = 0;
    }
    else
    {
      v57 = self;
      v58 = v10;
      v59 = v9;
      v61 = v7;
      v62 = v6;
      objc_msgSend(v9, "firstObject");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v63 = v14;
      -[NSObject representations](v14, "representations");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v68;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v68 != v17)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
            v20 = objc_alloc(MEMORY[0x1E0DBDCF0]);
            objc_msgSend(v19, "data");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "uti");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "role");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "size");
            v25 = v24;
            v27 = v26;
            objc_msgSend(v19, "effect");
            v28 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "description");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "isEqualToString:", CFSTR(".none"));

            if ((v30 & 1) != 0)
            {
              v31 = 0;
            }
            else
            {
              objc_msgSend(v28, "description");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v32, "isEqualToString:", CFSTR(".stroke"));

              if ((v33 & 1) != 0)
              {
                v31 = 1;
              }
              else
              {
                objc_msgSend(v28, "description");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = objc_msgSend(v34, "isEqualToString:", CFSTR(".comic"));

                if ((v35 & 1) != 0)
                {
                  v31 = 2;
                }
                else
                {
                  objc_msgSend(v28, "description");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v37 = objc_msgSend(v36, "isEqualToString:", CFSTR(".puffy"));

                  if ((v37 & 1) != 0)
                  {
                    v31 = 3;
                  }
                  else
                  {
                    objc_msgSend(v28, "description");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    v39 = objc_msgSend(v38, "isEqualToString:", CFSTR(".iridescent"));

                    if (v39)
                      v31 = 4;
                    else
                      v31 = 0;
                  }
                }
              }
            }

            v40 = (void *)objc_msgSend(v20, "initWithData:uti:role:size:effect:", v21, v22, v23, v31, v25, v27);
            objc_msgSend(v66, "addObject:", v40);

          }
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
        }
        while (v16);
      }

      if ((objc_opt_respondsToSelector() & 1) != 0)
        obja = -[NSObject performSelector:](v63, "performSelector:", sel_effectType);
      else
        obja = -1;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[NSObject metadata](v63, "metadata");
        v41 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v41 = 0;
      }
      v9 = v59;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[NSObject searchText](v63, "searchText");
        v42 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v42 = 0;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[NSObject accessibilityName](v63, "accessibilityName");

      }
      -[TIStickerCandidateGenerator _ckAttributionInfoFromSticker:](v57, "_ckAttributionInfoFromSticker:", v63);
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = (void *)v43;
      v45 = (void *)MEMORY[0x1E0C9AA70];
      if (v43)
        v45 = (void *)v43;
      v46 = v45;

      v47 = objc_alloc(MEMORY[0x1E0DBDCE8]);
      -[NSObject identifier](v63, "identifier");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject name](v63, "name");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject externalURI](v63, "externalURI");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject accessibilityName](v63, "accessibilityName");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject accessibilityName](v63, "accessibilityName");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v42;
      v60 = (void *)v42;
      v53 = (void *)v41;
      v13 = (void *)objc_msgSend(v47, "initWithIdentifier:representations:effectType:name:externalURI:accessibilityLabel:metadata:attributionInfo:searchText:accessibilityName:", v48, v66, obja, v49, v50, v51, v41, v46, v56, v52);

      v12 = v63;
      v7 = v61;
      v6 = v62;
      v11 = 0;
      v10 = v58;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_ckAttributionInfoFromSticker:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "attributionInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "adamID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("adam-id"));

    objc_msgSend(v4, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("bundle-id"));

    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("name"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)stickersForStickerIdentifiers:(id)a3 roles:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0DACC60];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  v15 = 0;
  objc_msgSend(v8, "stickersWithIdentifiers:roles:error:", v7, v6, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v15;
  if (v10)
  {
    TIStickerCandidateGeneratorOSLogFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Error returned from Stickers %@."), "-[TIStickerCandidateGenerator stickersForStickerIdentifiers:roles:]", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v14;
      _os_log_error_impl(&dword_1DA6F2000, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
    v12 = 0;
  }
  else
  {
    v12 = v9;
  }

  return v12;
}

- (id)stickerRepresentationsForStickerIdentifiers:(id)a3 roles:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0DACC60];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  v15 = 0;
  objc_msgSend(v8, "stickersWithIdentifiers:roles:error:", v7, v6, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v15;
  if (v10)
  {
    TIStickerCandidateGeneratorOSLogFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Error returned from Stickers %@."), "-[TIStickerCandidateGenerator stickerRepresentationsForStickerIdentifiers:roles:]", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v14;
      _os_log_error_impl(&dword_1DA6F2000, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
    v12 = 0;
  }
  else
  {
    v12 = v9;
  }

  return v12;
}

- (CGImage)_scaledImageForStickerImage:(CGImage *)a3 cellHeight:(double)a4
{
  double Width;
  CGFloat v7;
  CGFloat v8;
  CGColorSpace *ColorSpace;
  CGContext *v10;
  CGImage *Image;
  CGRect v13;

  Width = (double)CGImageGetWidth(a3);
  v7 = ceil(a4 * 0.5);
  v8 = ceil(v7 / (double)CGImageGetHeight(a3) * Width);
  ColorSpace = CGImageGetColorSpace(a3);
  v10 = CGBitmapContextCreate(0, (unint64_t)a4, (unint64_t)a4, 8uLL, 0, ColorSpace, 2u);
  CGContextSetInterpolationQuality(v10, kCGInterpolationHigh);
  v13.origin.x = floor((a4 - v8) * 0.5);
  v13.origin.y = floor((a4 - v7) * 0.5);
  v13.size.width = v8;
  v13.size.height = v7;
  CGContextDrawImage(v10, v13, a3);
  Image = CGBitmapContextCreateImage(v10);
  CGContextRelease(v10);
  return Image;
}

- (id)_generateKeyboardCandidatesForStickerRepresentations:(id)a3 withQuery:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  const __CFData *v15;
  CGImageSource *v16;
  CGImage *ImageAtIndex;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        TIStickerCandidateGeneratorOSLogFacility();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v27 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v13, "stickerIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stringWithFormat:", CFSTR("%s Setting up candidate for sticker %@."), "-[TIStickerCandidateGenerator _generateKeyboardCandidatesForStickerRepresentations:withQuery:]", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v45 = v29;
          _os_log_debug_impl(&dword_1DA6F2000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

        }
        objc_msgSend(v13, "data");
        v15 = (const __CFData *)objc_claimAutoreleasedReturnValue();
        v16 = CGImageSourceCreateWithData(v15, 0);

        ImageAtIndex = CGImageSourceCreateImageAtIndex(v16, 0, 0);
        if (v16)
          CFRelease(v16);
        if (ImageAtIndex)
        {
          -[TIStickerCandidateGenerator context](self, "context");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "createSlot");

          if (!(_DWORD)v19)
          {
            -[TIStickerCandidateGenerator createContext](self, "createContext");
            -[TIStickerCandidateGenerator context](self, "context");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v20, "createSlot");

            if (!(_DWORD)v19)
            {
              CGImageRelease(ImageAtIndex);
              TIStickerCandidateGeneratorOSLogFacility();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s SlotID is still 0 after recreating remote context"), "-[TIStickerCandidateGenerator _generateKeyboardCandidatesForStickerRepresentations:withQuery:]");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v45 = v38;
                _os_log_error_impl(&dword_1DA6F2000, v36, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

              }
              goto LABEL_24;
            }
          }
          -[TIStickerCandidateGenerator context](self, "context");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forSlot:", ImageAtIndex, v19);

          +[TIKeyboardSecureTouchManager sharedInstance](TIKeyboardSecureTouchManager, "sharedInstance");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "registerSlotID:", v19);

          CGImageRelease(ImageAtIndex);
          v23 = (void *)MEMORY[0x1E0DBDBE8];
          objc_msgSend(v13, "stickerIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "secureCandidateWithCandidate:forInput:slotID:customInfoType:stickerIdentifier:", &stru_1EA1081D0, v7, v19, 4096, v24);
          v25 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "addObject:", v25);
          TIStickerCandidateGeneratorOSLogFacility();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            v30 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v13, "stickerIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "stringWithFormat:", CFSTR("%s Submitting sticker %@."), "-[TIStickerCandidateGenerator _generateKeyboardCandidatesForStickerRepresentations:withQuery:]", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v45 = v32;
            _os_log_debug_impl(&dword_1DA6F2000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

          }
        }
        else
        {
          TIStickerCandidateGeneratorOSLogFacility();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            v33 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v13, "stickerIdentifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "stringWithFormat:", CFSTR("%s Sticker image for %@ is nil."), "-[TIStickerCandidateGenerator _generateKeyboardCandidatesForStickerRepresentations:withQuery:]", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v45 = v35;
            _os_log_debug_impl(&dword_1DA6F2000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

          }
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_24:

  return v8;
}

- (id)_generateKeyboardCandidatesForStickers:(id)a3 withQuery:(id)a4 withRenderTraits:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  const __CFData *v17;
  CGImageSource *v18;
  CGImage *ImageAtIndex;
  double v20;
  double v21;
  double v22;
  CGImage *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v48;
  id obj;
  id v50;
  id v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v51 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  if (v10)
  {
    v11 = v10;
    v52 = *(_QWORD *)v54;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v54 != v52)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        TIStickerCandidateGeneratorOSLogFacility();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v37 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v13, "identifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "stringWithFormat:", CFSTR("%s Setting up candidate for sticker %@."), "-[TIStickerCandidateGenerator _generateKeyboardCandidatesForStickers:withQuery:withRenderTraits:]", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v58 = v39;
          _os_log_debug_impl(&dword_1DA6F2000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

        }
        objc_msgSend(v13, "representations");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "data");
        v17 = (const __CFData *)objc_claimAutoreleasedReturnValue();
        v18 = CGImageSourceCreateWithData(v17, 0);

        ImageAtIndex = CGImageSourceCreateImageAtIndex(v18, 0, 0);
        if (v18)
          CFRelease(v18);
        if (ImageAtIndex)
        {
          objc_msgSend(v9, "singleCellHeight");
          v21 = v20;
          objc_msgSend(v9, "screenScale");
          v23 = -[TIStickerCandidateGenerator _scaledImageForStickerImage:cellHeight:](self, "_scaledImageForStickerImage:cellHeight:", ImageAtIndex, fmax(v21 * v22, 1.0));
          CGImageRelease(ImageAtIndex);
          -[TIStickerCandidateGenerator context](self, "context");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "createSlot");

          if (!(_DWORD)v25)
          {
            -[TIStickerCandidateGenerator createContext](self, "createContext");
            -[TIStickerCandidateGenerator context](self, "context");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v26, "createSlot");

            if (!(_DWORD)v25)
            {
              CGImageRelease(v23);
              TIStickerCandidateGeneratorOSLogFacility();
              v46 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s SlotID is still 0 after recreating remote context"), "-[TIStickerCandidateGenerator _generateKeyboardCandidatesForStickers:withQuery:withRenderTraits:]");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v58 = v48;
                _os_log_error_impl(&dword_1DA6F2000, v46, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

              }
              goto LABEL_24;
            }
          }
          -[TIStickerCandidateGenerator context](self, "context");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forSlot:", v23, v25);

          +[TIKeyboardSecureTouchManager sharedInstance](TIKeyboardSecureTouchManager, "sharedInstance");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "registerSlotID:", v25);

          CGImageRelease(v23);
          v29 = (void *)MEMORY[0x1E0DBDBE8];
          objc_msgSend(v13, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "secureCandidateWithCandidate:forInput:slotID:customInfoType:stickerIdentifier:", &stru_1EA1081D0, v51, v25, 4096, v30);
          v31 = objc_claimAutoreleasedReturnValue();

          +[TIAppAutofillManager sharedInstance](TIAppAutofillManager, "sharedInstance");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "secureCandidateRenderer");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (id)objc_msgSend(v33, "updateCachedCandidate:withStickerIdentifier:", v31, v34);

          objc_msgSend(v50, "addObject:", v31);
          TIStickerCandidateGeneratorOSLogFacility();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            v40 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v13, "identifier");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "stringWithFormat:", CFSTR("%s Submitting sticker %@."), "-[TIStickerCandidateGenerator _generateKeyboardCandidatesForStickers:withQuery:withRenderTraits:]", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v58 = v42;
            _os_log_debug_impl(&dword_1DA6F2000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

          }
        }
        else
        {
          TIStickerCandidateGeneratorOSLogFacility();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            v43 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v13, "identifier");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "stringWithFormat:", CFSTR("%s Sticker image for %@ is nil."), "-[TIStickerCandidateGenerator _generateKeyboardCandidatesForStickers:withQuery:withRenderTraits:]", v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v58 = v45;
            _os_log_debug_impl(&dword_1DA6F2000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

          }
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_24:

  return v50;
}

- (CAContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_queryToUUID, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomyGenerator, 0);
}

void __150__TIStickerCandidateGenerator__generateStickerCandidatesForGenerativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v11 = *(id *)(a1 + 48);
  v9 = v6;
  v10 = *(id *)(a1 + 40);
  v7 = v6;
  v8 = v5;
  TIDispatchAsync();

}

void __150__TIStickerCandidateGenerator__generateStickerCandidatesForGenerativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_90(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 *v14;
  unsigned __int8 v15;
  uint64_t v16;
  unsigned __int8 *v17;
  unsigned __int8 v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    TIStickerCandidateGeneratorOSLogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s CoreSpotlight returned %lu items."), "-[TIStickerCandidateGenerator _generateStickerCandidatesForGenerativeEmojiSearchableQueries:withRenderTraits:shouldAppend:language:completionHandler:]_block_invoke", objc_msgSend(v3, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v20;
      _os_log_debug_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = v3;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "attributeSet");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "attributeDictionary");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKey:", CFSTR("stickerIdentifier"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v12);
          if (v13)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v13);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v7);
    }

    v14 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(1u, v14));
    v3 = v22;
    if ((v15 & 1) != 0)
    {
      TIStickerCandidateGeneratorOSLogFacility();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Timeout before foundItemsHandler completed"), "-[TIStickerCandidateGenerator _generateStickerCandidatesForGenerativeEmojiSearchableQueries:withRenderTraits:shouldAppend:language:completionHandler:]_block_invoke");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v30 = v21;
        _os_log_error_impl(&dword_1DA6F2000, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else
  {
    v16 = *(int *)(a1 + 80);
    if (objc_msgSend(*(id *)(a1 + 40), "count") - 1 == v16)
    {
      v17 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32);
      do
        v18 = __ldaxr(v17);
      while (__stlxr(1u, v17));
      if ((v18 & 1) == 0)
      {
        v23 = *(id *)(a1 + 56);
        TIDispatchAsync();

      }
    }
  }

}

void __150__TIStickerCandidateGenerator__generateStickerCandidatesForGenerativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_2_92(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __150__TIStickerCandidateGenerator__generateStickerCandidatesForGenerativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  unsigned __int8 *v6;
  unsigned __int8 v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    TIStickerCandidateGeneratorOSLogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Error returned from CoreSpotlight %@."), "-[TIStickerCandidateGenerator _generateStickerCandidatesForGenerativeEmojiSearchableQueries:withRenderTraits:shouldAppend:language:completionHandler:]_block_invoke_3", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_error_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
  else
  {
    v5 = *(int *)(a1 + 56);
    if (objc_msgSend(*(id *)(a1 + 32), "count") - 1 != v5)
      goto LABEL_10;
  }
  v6 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32);
  do
    v7 = __ldaxr(v6);
  while (__stlxr(1u, v6));
  if ((v7 & 1) == 0)
  {
    v9 = *(id *)(a1 + 40);
    TIDispatchAsync();

  }
LABEL_10:

}

void __150__TIStickerCandidateGenerator__generateStickerCandidatesForGenerativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_2_94(uint64_t a1)
{
  unsigned __int8 *v2;
  unsigned __int8 v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(1u, v2));
  if ((v3 & 1) == 0)
  {
    TIStickerCandidateGeneratorOSLogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Timeout before TIStickerCandidateGenerator could finish."), "-[TIStickerCandidateGenerator _generateStickerCandidatesForGenerativeEmojiSearchableQueries:withRenderTraits:shouldAppend:language:completionHandler:]_block_invoke_2");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v8 = v5;
      _os_log_debug_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    v6 = *(id *)(a1 + 32);
    TIDispatchAsync();

  }
}

uint64_t __150__TIStickerCandidateGenerator__generateStickerCandidatesForGenerativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_95(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __150__TIStickerCandidateGenerator__generateStickerCandidatesForGenerativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_93(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __150__TIStickerCandidateGenerator__generateStickerCandidatesForGenerativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_91(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __150__TIStickerCandidateGenerator__generateStickerCandidatesForGenerativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  __CFString *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
    objc_msgSend(*(id *)(a1 + 48), "normalizedQueryString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:cost:", v2, v4, objc_msgSend(*(id *)(a1 + 32), "count"));

    if (*(_BYTE *)(a1 + 72))
    {
      v5 = &stru_1EA1081D0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "queryString");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v8 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v13 = CFSTR("com.apple.stickers.role.keyboard");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stickersForStickerIdentifiers:roles:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "_generateKeyboardCandidatesForStickers:withQuery:withRenderTraits:", v10, v5, *(_QWORD *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
  else
  {
    TIStickerCandidateGeneratorOSLogFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s No sticker suggestions have been received."), "-[TIStickerCandidateGenerator _generateStickerCandidatesForGenerativeEmojiSearchableQueries:withRenderTraits:shouldAppend:language:completionHandler:]_block_invoke_2");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v12;
      _os_log_debug_impl(&dword_1DA6F2000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

void __143__TIStickerCandidateGenerator__generateStickerCandidatesForTaxonomySearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v11 = *(id *)(a1 + 48);
  v9 = v6;
  v10 = *(id *)(a1 + 40);
  v7 = v6;
  v8 = v5;
  TIDispatchAsync();

}

void __143__TIStickerCandidateGenerator__generateStickerCandidatesForTaxonomySearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_63(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  unsigned __int8 *v29;
  unsigned __int8 v30;
  uint64_t v31;
  unsigned __int8 *v32;
  unsigned __int8 v33;
  NSObject *v34;
  void *v35;
  void *v36;
  _QWORD *v37;
  id v38;
  id obj;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint8_t v50[128];
  uint8_t buf[4];
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v37 = (_QWORD *)a1;
    TIStickerCandidateGeneratorOSLogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s CoreSpotlight returned %lu items."), "-[TIStickerCandidateGenerator _generateStickerCandidatesForTaxonomySearchableQueries:withRenderTraits:shouldAppend:language:completionHandler:]_block_invoke", objc_msgSend(v3, "count"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v52 = v35;
      _os_log_debug_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v38 = v3;
    obj = v3;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v46 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v10, "attributeSet");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "attributeDictionary");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", CFSTR("stickerIdentifier"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v13);
          if (v14)
          {
            objc_msgSend(v10, "attributeSet");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "lastUsedDate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "timeIntervalSinceReferenceDate");
            v18 = v17;

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v19);

          }
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v7);
    }

    objc_msgSend(v5, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sortedArrayUsingSelector:", sel_compare_);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(v21, "reverseObjectEnumerator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v42 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*(_QWORD *)(v37[8] + 8) + 40);
          objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v28);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v24);
    }

    v29 = (unsigned __int8 *)(*(_QWORD *)(v37[9] + 8) + 32);
    do
      v30 = __ldaxr(v29);
    while (__stlxr(1u, v29));
    if ((v30 & 1) != 0)
    {
      TIStickerCandidateGeneratorOSLogFacility();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Timeout before foundItemsHandler completed"), "-[TIStickerCandidateGenerator _generateStickerCandidatesForTaxonomySearchableQueries:withRenderTraits:shouldAppend:language:completionHandler:]_block_invoke");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v52 = v36;
        _os_log_error_impl(&dword_1DA6F2000, v34, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    else
    {
      (*(void (**)(void))(v37[6] + 16))();
    }
    v3 = v38;

    goto LABEL_33;
  }
  v31 = *(int *)(a1 + 80);
  if (objc_msgSend(*(id *)(a1 + 40), "count") - 1 == v31)
  {
    v32 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32);
    do
      v33 = __ldaxr(v32);
    while (__stlxr(1u, v32));
    if ((v33 & 1) == 0)
    {
      v40 = *(id *)(a1 + 56);
      TIDispatchAsync();
      v5 = v40;
LABEL_33:

    }
  }

}

void __143__TIStickerCandidateGenerator__generateStickerCandidatesForTaxonomySearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_2_74(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __143__TIStickerCandidateGenerator__generateStickerCandidatesForTaxonomySearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  unsigned __int8 *v6;
  unsigned __int8 v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    TIStickerCandidateGeneratorOSLogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Error returned from CoreSpotlight %@."), "-[TIStickerCandidateGenerator _generateStickerCandidatesForTaxonomySearchableQueries:withRenderTraits:shouldAppend:language:completionHandler:]_block_invoke_3", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_error_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
  else
  {
    v5 = *(int *)(a1 + 56);
    if (objc_msgSend(*(id *)(a1 + 32), "count") - 1 != v5)
      goto LABEL_10;
  }
  v6 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32);
  do
    v7 = __ldaxr(v6);
  while (__stlxr(1u, v6));
  if ((v7 & 1) == 0)
  {
    v9 = *(id *)(a1 + 40);
    TIDispatchAsync();

  }
LABEL_10:

}

void __143__TIStickerCandidateGenerator__generateStickerCandidatesForTaxonomySearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_2_79(uint64_t a1)
{
  unsigned __int8 *v2;
  unsigned __int8 v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(1u, v2));
  if ((v3 & 1) == 0)
  {
    TIStickerCandidateGeneratorOSLogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Timeout before TIStickerCandidateGenerator could finish."), "-[TIStickerCandidateGenerator _generateStickerCandidatesForTaxonomySearchableQueries:withRenderTraits:shouldAppend:language:completionHandler:]_block_invoke_2");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v8 = v5;
      _os_log_debug_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    v6 = *(id *)(a1 + 32);
    TIDispatchAsync();

  }
}

uint64_t __143__TIStickerCandidateGenerator__generateStickerCandidatesForTaxonomySearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_82(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __143__TIStickerCandidateGenerator__generateStickerCandidatesForTaxonomySearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_77(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __143__TIStickerCandidateGenerator__generateStickerCandidatesForTaxonomySearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_73(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __143__TIStickerCandidateGenerator__generateStickerCandidatesForTaxonomySearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  __CFString *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
    objc_msgSend(*(id *)(a1 + 48), "normalizedQueryString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:cost:", v2, v4, objc_msgSend(*(id *)(a1 + 32), "count"));

    if (*(_BYTE *)(a1 + 72))
    {
      v5 = &stru_1EA1081D0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "queryString");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v8 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v15 = CFSTR("com.apple.stickers.role.keyboard");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stickersForStickerIdentifiers:roles:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "_generateKeyboardCandidatesForStickers:withQuery:withRenderTraits:", v10, v5, *(_QWORD *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    TIStickerCandidateGeneratorOSLogFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Finished submitting %lu suggestions."), "-[TIStickerCandidateGenerator _generateStickerCandidatesForTaxonomySearchableQueries:withRenderTraits:shouldAppend:language:completionHandler:]_block_invoke", objc_msgSend(v11, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v13;
      _os_log_debug_impl(&dword_1DA6F2000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  else
  {
    TIStickerCandidateGeneratorOSLogFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s No sticker suggestions have been received."), "-[TIStickerCandidateGenerator _generateStickerCandidatesForTaxonomySearchableQueries:withRenderTraits:shouldAppend:language:completionHandler:]_block_invoke_2");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v14;
      _os_log_debug_impl(&dword_1DA6F2000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

void __134__TIStickerCandidateGenerator_generateStickerCandidatesForSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __134__TIStickerCandidateGenerator_generateStickerCandidatesForSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __134__TIStickerCandidateGenerator_generateStickerCandidatesForSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v2 = dispatch_time(0, 200000000);
  if (dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), v2))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __134__TIStickerCandidateGenerator_generateStickerCandidatesForSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_4;
    v10[3] = &unk_1EA102958;
    v11 = v4;
    v12 = v3;
    v6 = v3;
    v9 = v4;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = (void *)objc_msgSend(v6, "copy");
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
}

void __134__TIStickerCandidateGenerator_generateStickerCandidatesForSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "stickerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }

}

void __45__TIStickerCandidateGenerator_sharedInstance__block_invoke()
{
  TIStickerCandidateGenerator *v0;
  void *v1;

  v0 = objc_alloc_init(TIStickerCandidateGenerator);
  v1 = (void *)sharedInstance___stickerCandidateGenerator;
  sharedInstance___stickerCandidateGenerator = (uint64_t)v0;

}

@end
