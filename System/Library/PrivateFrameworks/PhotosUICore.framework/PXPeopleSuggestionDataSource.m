@implementation PXPeopleSuggestionDataSource

- (PXPeopleSuggestionDataSource)initWithFlowType:(unint64_t)a3
{
  PXPeopleSuggestionDataSource *v4;
  PXPeopleSuggestionDataSource *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXPeopleSuggestionDataSource;
  v4 = -[PXPeopleSuggestionDataSource init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_initialPageLimit = 1;
    -[PXPeopleSuggestionDataSource setFlowType:](v4, "setFlowType:", a3);
  }
  return v5;
}

- (id)fetchAndCacheMergeCandidatesForPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXPeopleSuggestionDataSource mergeCandidateFetchResult](self, "mergeCandidateFetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", 0, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIncludeOnlyPersonsWithVisibleKeyFaces:", 1);
    v18[0] = *MEMORY[0x1E0CD1D60];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFetchPropertySets:", v7);

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("faceCount"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSortDescriptors:", v10);

    objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIncludedDetectionTypes:", v11);

    +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v12, "useBootstrapMockDataSource");

    if ((_DWORD)v9)
    {
      objc_msgSend(v6, "setFetchLimit:", 9);
      objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD16C0], "fetchMergeCandidatePersonsForPerson:options:", v4, v6);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleSuggestionDataSource setMergeCandidateFetchResult:](self, "setMergeCandidateFetchResult:", v5);
    v13 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(v5, "fetchedObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleSuggestionDataSource setMergeCandidates:](self, "setMergeCandidates:", v15);

  }
  return v5;
}

- (void)setFlowType:(unint64_t)a3
{
  uint64_t v3;

  self->_flowType = a3;
  if (a3 == 1)
  {
    v3 = 0;
  }
  else
  {
    if (a3)
      return;
    v3 = 2;
  }
  -[PXPeopleSuggestionDataSource setSuggestionFetchType:](self, "setSuggestionFetchType:", v3);
}

- (id)suggestionsForPerson:(id)a3 withConfirmedSuggestions:(id)a4 andRejectedSuggestions:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  PXSuggestionToken *v21;
  NSObject *v22;
  PXSuggestionToken *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  PXSuggestionToken *v28;
  PXSuggestionToken *v29;
  void *v31;
  void *v32;
  void *v33;
  _QWORD block[5];
  id v35;
  id v36;
  id v37;
  PXSuggestionToken *v38;
  id v39;
  id v40[3];
  id buf[2];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void *)objc_opt_class();
  v16 = (void *)objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleSuggestionDataSource.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[person isKindOfClass:personClass]"));

  }
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleSuggestionDataSource.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[confirmedSuggestion isKindOfClass:suggestionClass] || [confirmedSuggestion isKindOfClass:personClass]"));

    }
  }
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleSuggestionDataSource.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rejectedSuggestion isKindOfClass:suggestionClass] || [rejectedSuggestion isKindOfClass:personClass]"));

    }
  }
  v19 = v11;
  PLUIGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEBUG, "Suggestions UI: Fetching suggestions", (uint8_t *)buf, 2u);
  }

  v21 = objc_alloc_init(PXSuggestionToken);
  objc_initWeak(buf, self);
  dispatch_get_global_queue(25, 0);
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__PXPeopleSuggestionDataSource_suggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions_completion___block_invoke;
  block[3] = &unk_1E511F288;
  objc_copyWeak(v40, buf);
  block[4] = self;
  v35 = v19;
  v36 = v12;
  v37 = v13;
  v39 = v14;
  v23 = v21;
  v38 = v23;
  v40[1] = v15;
  v40[2] = v16;
  v24 = v14;
  v25 = v13;
  v26 = v12;
  v27 = v19;
  dispatch_async(v22, block);

  v28 = v38;
  v29 = v23;

  objc_destroyWeak(v40);
  objc_destroyWeak(buf);

  return v29;
}

- (BOOL)cancelSuggestionForPerson:(id)a3 withToken:(id)a4 error:(id *)a5
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "cancel");
  v6 = objc_msgSend(v5, "token");

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelOperationsWithIdentifiers:reply:", v9, &__block_literal_global_64906);

  }
  return 1;
}

- (id)commitSuggestionsForPerson:(id)a3 withConfirmedSuggestions:(id)a4 andRejectedSuggestions:(id)a5
{
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  char isKindOfClass;
  void *v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t m;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  uint64_t v56;
  NSObject *v57;
  NSObject *v58;
  NSObject *v59;
  NSObject *v60;
  uint64_t v61;
  id v62;
  id v63;
  NSObject *v64;
  NSObject *v65;
  unint64_t v66;
  void *v67;
  PXPeopleConfirmationInfo *v68;
  PXPeopleConfirmationInfo *v69;
  void *v70;
  NSObject *v71;
  NSObject *v72;
  id v73;
  NSObject *v74;
  NSObject *v75;
  void *v76;
  void *v78;
  void *v79;
  void *v80;
  NSObject *v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  BOOL v86;
  id v87;
  uint64_t v88;
  os_signpost_id_t spid;
  void *v90;
  unint64_t v91;
  NSObject *v92;
  id v93;
  id v95;
  id v96;
  id v97;
  void *v98;
  id v99;
  id v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  id obj;
  _QWORD block[4];
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  id v118;
  _QWORD v119[4];
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  uint8_t *v125;
  BOOL v126;
  BOOL v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  uint8_t buf[8];
  uint8_t *v137;
  uint64_t v138;
  uint64_t (*v139)(uint64_t, uint64_t);
  void (*v140)(uint64_t);
  id v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _BYTE v150[128];
  uint8_t v151[128];
  uint8_t v152[4];
  uint64_t v153;
  __int16 v154;
  uint64_t v155;
  __int16 v156;
  uint64_t v157;
  __int16 v158;
  uint64_t v159;
  _BYTE v160[128];
  _BYTE v161[128];
  uint64_t v162;

  v162 = *MEMORY[0x1E0C80C00];
  v97 = a3;
  v96 = a4;
  v95 = a5;
  +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v98, "enableBootstrapDemoMode") & 1) != 0
    || objc_msgSend(v98, "useBootstrapMockDataSource"))
  {
    v8 = v97;
  }
  else
  {
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_generate(v9);
    v11 = v9;
    v12 = v11;
    spid = v10;
    v91 = v10 - 1;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "commitSuggestionsForPerson", ", buf, 2u);
    }
    v92 = v12;

    objc_opt_class();
    v13 = objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleSuggestionDataSource.m"), 206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[person isKindOfClass:personClass]"));

    }
    if (objc_msgSend(v96, "count"))
    {
      objc_msgSend(v96, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleSuggestionDataSource.m"), 209, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[confirmedSuggestion isKindOfClass:suggestionClass] || [confirmedSuggestion isKindOfClass:personClass]"));

      }
    }
    if (objc_msgSend(v95, "count"))
    {
      objc_msgSend(v95, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleSuggestionDataSource.m"), 213, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rejectedSuggestion isKindOfClass:suggestionClass] || [rejectedSuggestion isKindOfClass:personClass]"));

      }
    }
    v93 = v97;
    if (v93)
    {
      v104 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v96, "count"));
      v101 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v96, "count"));
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v95, "count"));
      v103 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v95, "count"));
      v148 = 0u;
      v149 = 0u;
      v146 = 0u;
      v147 = 0u;
      obj = v96;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v161, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v147;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v147 != v18)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * i);
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v104, "addObject:", v20);
            }
            else if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v20, "person");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v101, "addObject:", v21);

            }
          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v161, 16);
        }
        while (v17);
      }

      v144 = 0u;
      v145 = 0u;
      v142 = 0u;
      v143 = 0u;
      v22 = v95;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v142, v160, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v143;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v143 != v24)
              objc_enumerationMutation(v22);
            v26 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * j);
            isKindOfClass = objc_opt_isKindOfClass();
            v28 = v16;
            if ((isKindOfClass & 1) == 0)
            {
              v29 = objc_opt_isKindOfClass();
              v28 = v103;
              if ((v29 & 1) == 0)
                continue;
            }
            objc_msgSend(v28, "addObject:", v26);
          }
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v142, v160, 16);
        }
        while (v23);
      }

      objc_msgSend(v103, "_pl_map:", &__block_literal_global_157);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v104, "count");
      v31 = objc_msgSend(v101, "count");
      v32 = objc_msgSend(v16, "count");
      v88 = objc_msgSend(v90, "count");
      v86 = v32 != 0;
      *(_QWORD *)buf = 0;
      v137 = buf;
      v138 = 0x3032000000;
      v139 = __Block_byref_object_copy__64810;
      v140 = __Block_byref_object_dispose__64811;
      v141 = 0;
      PLUIGetLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v152 = 134218752;
        v153 = v30;
        v154 = 2048;
        v155 = v32;
        v156 = 2048;
        v157 = v31;
        v158 = 2048;
        v159 = v88;
        _os_log_impl(&dword_1A6789000, v33, OS_LOG_TYPE_INFO, "[People][Commit] %lu / %lu persons, %lu / %lu suggestions", v152, 0x2Au);
      }

      if (v30 != 0 || v31 != 0 || v32 != 0 || v88 != 0)
      {
        objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        if (PFOSVariantHasInternalDiagnostics())
        {
          v83 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          if (v30)
          {
            objc_msgSend(v104, "_pl_map:", &__block_literal_global_161_64814);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "addObjectsFromArray:", v34);

          }
          if (v32)
          {
            objc_msgSend(v16, "_pl_map:", &__block_literal_global_162);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "addObjectsFromArray:", v35);

          }
          if (objc_msgSend(v83, "count"))
          {
            v36 = v92;
            v37 = v36;
            if (v91 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
            {
              *(_WORD *)v152 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A6789000, v37, OS_SIGNPOST_INTERVAL_BEGIN, spid, "fetchMergeCandidateWithConfidencePersons", ", v152, 2u);
            }
            v81 = v37;

            objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", 0, v93);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "setIncludeOnlyPersonsWithVisibleKeyFaces:", 1);
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("personUUID IN %@"), v83);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "setInternalPredicate:", v38);

            objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "setIncludedDetectionTypes:", v39);

            objc_msgSend(MEMORY[0x1E0CD16C0], "fetchMergeCandidateWithConfidencePersonsForPerson:options:", v93, v82);
            v134 = 0u;
            v135 = 0u;
            v132 = 0u;
            v133 = 0u;
            v99 = (id)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v132, v151, 16);
            if (v40)
            {
              v41 = *(_QWORD *)v133;
              do
              {
                for (k = 0; k != v40; ++k)
                {
                  if (*(_QWORD *)v133 != v41)
                    objc_enumerationMutation(v99);
                  v43 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * k);
                  v44 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v43, "mergeCandidateConfidence");
                  objc_msgSend(v44, "numberWithDouble:");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "uuid");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v102, "setObject:forKeyedSubscript:", v45, v46);

                }
                v40 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v132, v151, 16);
              }
              while (v40);
            }

            objc_msgSend(MEMORY[0x1E0CD16C0], "fetchMergeCandidatePersonsForPerson:options:", v93, v82);
            v130 = 0u;
            v131 = 0u;
            v128 = 0u;
            v129 = 0u;
            v47 = (id)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v128, v150, 16);
            if (v48)
            {
              v49 = *(_QWORD *)v129;
              do
              {
                for (m = 0; m != v48; ++m)
                {
                  if (*(_QWORD *)v129 != v49)
                    objc_enumerationMutation(v47);
                  v51 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * m);
                  v52 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v51, "mergeCandidateConfidence");
                  objc_msgSend(v52, "numberWithDouble:");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "uuid");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v102, "setObject:forKeyedSubscript:", v53, v54);

                }
                v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v128, v150, 16);
              }
              while (v48);
            }

            PLUIGetLog();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              v56 = objc_msgSend(v102, "count");
              *(_DWORD *)v152 = 134217984;
              v153 = v56;
              _os_log_impl(&dword_1A6789000, v55, OS_LOG_TYPE_INFO, "[People][Commit] fetched %lu candidates with confidence", v152, 0xCu);
            }

            v57 = v81;
            v58 = v57;
            if (v91 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v57))
            {
              *(_WORD *)v152 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A6789000, v58, OS_SIGNPOST_INTERVAL_END, spid, "fetchMergeCandidateWithConfidencePersons", ", v152, 2u);
            }

          }
        }
        v59 = v92;
        v60 = v59;
        if (v91 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
        {
          *(_WORD *)v152 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v60, OS_SIGNPOST_INTERVAL_BEGIN, spid, "updateDatabaseWithSuggestions", ", v152, 2u);
        }

        v61 = MEMORY[0x1E0C809B0];
        v119[0] = MEMORY[0x1E0C809B0];
        v119[1] = 3221225472;
        v119[2] = __107__PXPeopleSuggestionDataSource_commitSuggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions___block_invoke_166;
        v119[3] = &unk_1E511F370;
        v62 = v104;
        v120 = v62;
        v84 = v101;
        v121 = v84;
        v63 = v93;
        v122 = v63;
        v126 = v88 != 0;
        v123 = v90;
        v127 = v86;
        v87 = v16;
        v124 = v87;
        v125 = buf;
        v118 = 0;
        objc_msgSend(v85, "performChangesAndWait:error:", v119, &v118);
        v100 = v118;
        v64 = v60;
        v65 = v64;
        if (v91 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
        {
          *(_WORD *)v152 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v65, OS_SIGNPOST_INTERVAL_END, spid, "updateDatabaseWithSuggestions", ", v152, 2u);
        }

        v66 = -[PXPeopleSuggestionDataSource flowType](self, "flowType");
        if (!v66)
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v62);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = [PXPeopleConfirmationInfo alloc];
          v69 = -[PXPeopleConfirmationInfo initWithSourcePerson:targetPerson:confirmedSuggestions:](v68, "initWithSourcePerson:targetPerson:confirmedSuggestions:", v63, *((_QWORD *)v137 + 5), v67);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "postNotificationName:object:", CFSTR("PXPeopleConfirmationDidFinish"), v69);

        }
        if (v100)
        {
          PLUIGetLog();
          v71 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v152 = 138412290;
            v153 = (uint64_t)v100;
            _os_log_impl(&dword_1A6789000, v71, OS_LOG_TYPE_DEBUG, "Persisting confirmation choices failed: %@", v152, 0xCu);
          }

        }
        dispatch_get_global_queue(17, 0);
        v72 = objc_claimAutoreleasedReturnValue();
        block[0] = v61;
        block[1] = 3221225472;
        block[2] = __107__PXPeopleSuggestionDataSource_commitSuggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions___block_invoke_172;
        block[3] = &unk_1E511F448;
        v107 = v84;
        v108 = v62;
        v109 = v87;
        v110 = v63;
        v115 = v66;
        v111 = v103;
        v112 = v102;
        v116 = v88;
        v117 = v13;
        v113 = obj;
        v114 = v22;
        v73 = v102;
        dispatch_async(v72, block);

      }
      v74 = v92;
      v75 = v74;
      if (v91 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v74))
      {
        *(_WORD *)v152 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v75, OS_SIGNPOST_INTERVAL_END, spid, "commitSuggestionsForPerson", ", v152, 2u);
      }

      v76 = (void *)*((_QWORD *)v137 + 5);
      if (!v76)
        v76 = v93;
      v8 = v76;
      _Block_object_dispose(buf, 8);

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (void)startListeningForLibraryChanges
{
  id v3;

  if (-[PXPeopleSuggestionDataSource flowType](self, "flowType") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerChangeObserver:", self);

  }
}

- (void)stopListeningForLibraryChanges
{
  id v3;

  if (-[PXPeopleSuggestionDataSource flowType](self, "flowType") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unregisterChangeObserver:", self);

  }
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD block[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  const __CFString *v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXPeopleSuggestionDataSource mergeCandidateFetchResult](self, "mergeCandidateFetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeDetailsForFetchResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v13, "objectID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v4, "keyFaceChangedForPersonOID:", v14))
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v7, "count"))
    {
      v23 = CFSTR("PXPeopleUpdatedKeyFacePersonsKey");
      v24 = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__PXPeopleSuggestionDataSource_photoLibraryDidChange___block_invoke;
      block[3] = &unk_1E5149198;
      v18 = v15;
      v16 = v15;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }

}

- (unint64_t)initialPageLimit
{
  return self->_initialPageLimit;
}

- (void)setInitialPageLimit:(unint64_t)a3
{
  self->_initialPageLimit = a3;
}

- (unint64_t)suggestionFetchType
{
  return self->_suggestionFetchType;
}

- (void)setSuggestionFetchType:(unint64_t)a3
{
  self->_suggestionFetchType = a3;
}

- (unint64_t)flowType
{
  return self->_flowType;
}

- (NSArray)mergeCandidates
{
  return self->_mergeCandidates;
}

- (void)setMergeCandidates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (PHFetchResult)mergeCandidateFetchResult
{
  return self->_mergeCandidateFetchResult;
}

- (void)setMergeCandidateFetchResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergeCandidateFetchResult, 0);
  objc_storeStrong((id *)&self->_mergeCandidates, 0);
}

void __54__PXPeopleSuggestionDataSource_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("PXPeopleSuggestionManagerKeyFaceUpdateNotification"), 0, *(_QWORD *)(a1 + 32));

}

void __107__PXPeopleSuggestionDataSource_commitSuggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions___block_invoke_166(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count") + objc_msgSend(*(id *)(a1 + 40), "count") + 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v11, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v11, "addObject:", *(_QWORD *)(a1 + 48));
  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v2 + objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v4 = objc_msgSend(*(id *)(a1 + 48), "verifiedType");
    v5 = (void *)MEMORY[0x1E0CD16D8];
    if (v4 >= 1)
    {
      objc_msgSend(*(id *)(a1 + 48), "localIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "changeRequestForMergingPersons:nominalTargetIdentifier:", v11, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForMergingPersons:", v11);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", *(_QWORD *)(a1 + 48));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v3;
LABEL_7:
  if (objc_msgSend(*(id *)(a1 + 48), "verifiedType") != 1)
    objc_msgSend(v7, "setVerifiedType:", 1);
  if (*(_BYTE *)(a1 + 80))
    objc_msgSend(v7, "addRejectedFaces:forCluster:", *(_QWORD *)(a1 + 56), 1);
  if (*(_BYTE *)(a1 + 81))
    objc_msgSend(v7, "rejectMergeCandidatePersons:", *(_QWORD *)(a1 + 64));
  +[PXPeopleSuggestionDataSource _mergeAndSaveUserFeedbackForPersons:personChangeRequest:](PXPeopleSuggestionDataSource, "_mergeAndSaveUserFeedbackForPersons:personChangeRequest:", v11, v7);
  objc_msgSend(v7, "targetPerson");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __107__PXPeopleSuggestionDataSource_commitSuggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions___block_invoke_172(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  id v46;
  void (**v47)(void *, const __CFString *, _QWORD);
  uint64_t v48;
  id v49;
  id v50;
  void (**v51)(void *, const __CFString *, _QWORD);
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[4];
  id v63;
  id v64;
  uint64_t v65;
  _QWORD aBlock[4];
  id v67;
  id v68;
  id v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[4];
  _QWORD v80[4];
  _QWORD v81[9];
  _QWORD v82[9];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v76 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * i), "faceCount");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  v73 = 0u;
  v74 = 0u;
  v72 = 0u;
  v71 = 0u;
  v8 = *(id *)(a1 + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v72;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v72 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * j), "faceCount");
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_175);
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_176);
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "filteredArrayUsingPredicate:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "filteredArrayUsingPredicate:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)v13;
  objc_msgSend(*(id *)(a1 + 48), "filteredArrayUsingPredicate:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)v14;
  objc_msgSend(*(id *)(a1 + 48), "filteredArrayUsingPredicate:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueForKeyPath:", CFSTR("@sum.faceCount"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v19, "integerValue");

  objc_msgSend(v17, "valueForKeyPath:", CFSTR("@sum.faceCount"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v20, "integerValue");

  objc_msgSend(v16, "valueForKeyPath:", CFSTR("@sum.faceCount"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "integerValue");

  objc_msgSend(v18, "valueForKeyPath:", CFSTR("@sum.faceCount"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "integerValue");

  v81[0] = CFSTR("mergeCandidatesVerifiedConfirmed");
  v59 = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v55;
  v81[1] = CFSTR("mergeCandidatesVerifiedRejected");
  v57 = v17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v54;
  v81[2] = CFSTR("mergeCandidatesUnverifiedConfirmed");
  v58 = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v82[2] = v25;
  v81[3] = CFSTR("mergeCandidatesUnverifiedRejected");
  v56 = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v82[3] = v26;
  v81[4] = CFSTR("facesVerifiedConfirmed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v53);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v82[4] = v27;
  v81[5] = CFSTR("facesVerifiedRejected");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v52);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v82[5] = v28;
  v81[6] = CFSTR("facesUnverifiedConfirmed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v22);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v82[6] = v29;
  v81[7] = CFSTR("facesUnverifiedRejected");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v24);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v82[7] = v30;
  v81[8] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(*(id *)(a1 + 56), "detectionType"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v82[8] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 9);
  v32 = objc_claimAutoreleasedReturnValue();

  v33 = *(_QWORD *)(a1 + 96);
  if (v33)
  {
    v34 = (void *)v32;
    v35 = 0x1E0CB3000;
    if (v33 == 1)
      objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.people.bootstrap.mergeCandidates.confirmedAndRejectedCounts"), v32);
  }
  else
  {
    v34 = (void *)v32;
    objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.people.confirmAdditional.mergeCandidates.confirmedAndRejectedCounts"), v32);
    v36 = (void *)MEMORY[0x1E0D09910];
    v79[0] = CFSTR("suggestionsConfirmed");
    v35 = 0x1E0CB3000uLL;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = v37;
    v79[1] = CFSTR("suggestionsRejected");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v80[1] = v38;
    v79[2] = CFSTR("facesConfirmed");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v80[2] = v39;
    v79[3] = CFSTR("facesRejected");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 104));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v80[3] = v40;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 4);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.people.confirmAdditional.personSuggestions.confirmedAndRejectedCounts"), v41);

  }
  if (objc_msgSend(*(id *)(a1 + 72), "count", v52)
    || objc_msgSend(*(id *)(a1 + 32), "count")
    || objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    objc_msgSend(*(id *)(v35 + 2024), "numberWithInteger:", objc_msgSend(*(id *)(a1 + 56), "faceCount"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v35 + 2024), "numberWithShort:", objc_msgSend(*(id *)(a1 + 56), "detectionType"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __107__PXPeopleSuggestionDataSource_commitSuggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions___block_invoke_4;
    aBlock[3] = &unk_1E511F3F8;
    v67 = *(id *)(a1 + 72);
    v45 = v42;
    v68 = v45;
    v69 = *(id *)(a1 + 56);
    v46 = v43;
    v70 = v46;
    v47 = (void (**)(void *, const __CFString *, _QWORD))_Block_copy(aBlock);
    v47[2](v47, CFSTR("confirmed"), *(_QWORD *)(a1 + 40));
    v47[2](v47, CFSTR("rejected"), *(_QWORD *)(a1 + 48));
    v62[0] = v44;
    v62[1] = 3221225472;
    v62[2] = __107__PXPeopleSuggestionDataSource_commitSuggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions___block_invoke_5;
    v62[3] = &unk_1E511F420;
    v48 = *(_QWORD *)(a1 + 112);
    v64 = v45;
    v65 = v48;
    v63 = v46;
    v49 = v45;
    v50 = v46;
    v51 = (void (**)(void *, const __CFString *, _QWORD))_Block_copy(v62);
    v51[2](v51, CFSTR("confirmed"), *(_QWORD *)(a1 + 80));
    v51[2](v51, CFSTR("rejected"), *(_QWORD *)(a1 + 88));

  }
}

void __107__PXPeopleSuggestionDataSource_commitSuggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id obj;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[7];
  _QWORD v26[7];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v20 = a2;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v9, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v11)
        {
          v25[0] = CFSTR("personUUID");
          v25[1] = CFSTR("action");
          v26[0] = v10;
          v26[1] = v20;
          v26[2] = v11;
          v25[2] = CFSTR("confidence");
          v25[3] = CFSTR("candidateFaceCount");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "faceCount"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = *(_QWORD *)(a1 + 40);
          v14 = *(void **)(a1 + 48);
          v26[3] = v13;
          v26[4] = v15;
          v25[4] = CFSTR("targetFaceCount");
          v25[5] = CFSTR("targetAgeType");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v14, "ageType"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v25[6] = CFSTR("type");
          v17 = *(_QWORD *)(a1 + 56);
          v26[5] = v16;
          v26[6] = v17;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 7);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.people.candidateWithConfidence"), v18);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v6);
  }

}

void __107__PXPeopleSuggestionDataSource_commitSuggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id obj;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[6];
  _QWORD v30[6];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v21 = a2;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = a3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v8);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v23 = (void *)MEMORY[0x1E0D09910];
          v29[0] = CFSTR("action");
          v29[1] = CFSTR("type");
          v10 = *(_QWORD *)(a1 + 32);
          v11 = *(_QWORD *)(a1 + 40);
          v30[0] = v21;
          v30[1] = v10;
          v30[2] = v11;
          v29[2] = CFSTR("targetFaceCount");
          v29[3] = CFSTR("suggestionFaceCount");
          v12 = (void *)MEMORY[0x1E0CB37E8];
          v13 = v9;
          objc_msgSend(v13, "person");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v24, "faceCount"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v30[3] = v14;
          v29[4] = CFSTR("similarityScore");
          v15 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v13, "similarityScore");
          objc_msgSend(v15, "numberWithDouble:");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v30[4] = v16;
          v29[5] = CFSTR("personUUID");
          objc_msgSend(v13, "person");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "uuid");
          v18 = v6;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v30[5] = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 6);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.people.confirmAdditional.suggestion"), v20);

          v6 = v18;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v6);
  }

}

uint64_t __107__PXPeopleSuggestionDataSource_commitSuggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isVerified") ^ 1;
}

uint64_t __107__PXPeopleSuggestionDataSource_commitSuggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions___block_invoke_2_173(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isVerified");
}

uint64_t __107__PXPeopleSuggestionDataSource_commitSuggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

uint64_t __107__PXPeopleSuggestionDataSource_commitSuggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions___block_invoke_159(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

uint64_t __107__PXPeopleSuggestionDataSource_commitSuggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "keyFace");
}

void __112__PXPeopleSuggestionDataSource_suggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  void (*v19)(void);
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[5];
  uint8_t buf[16];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 80);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v4 = objc_msgSend(WeakRetained, "suggestionFetchType");

  if (v4 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "mergeCandidates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      PLUIGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "Suggestions UI: Fetching merge candidates from database", buf, 2u);
      }

      v7 = objc_loadWeakRetained(v2);
      v8 = (id)objc_msgSend(v7, "fetchAndCacheMergeCandidatesForPerson:", *(_QWORD *)(a1 + 40));

    }
  }
  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "mergeCandidates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = objc_loadWeakRetained(v2);
    objc_msgSend(v12, "mergeCandidates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    objc_msgSend(v14, "removeObjectsInArray:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v14, "removeObjectsInArray:", *(_QWORD *)(a1 + 56));
    v15 = objc_loadWeakRetained(v2);
    objc_msgSend(v15, "setMergeCandidates:", v14);

  }
  v16 = objc_loadWeakRetained(v2);
  objc_msgSend(v16, "mergeCandidates");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "count") && *(_QWORD *)(a1 + 72))
  {
    PLUIGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEBUG, "Suggestions UI: Suggestion dataSource returning merge candidates", buf, 2u);
    }

    v19 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
    goto LABEL_19;
  }
  if ((objc_msgSend(*(id *)(a1 + 64), "canceled") & 1) != 0 || !v4)
  {
    v22 = *(_QWORD *)(a1 + 72);
    if (v22)
    {
      v19 = *(void (**)(void))(v22 + 16);
LABEL_19:
      v19();
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "arrayByAddingObjectsFromArray:", *(_QWORD *)(a1 + 56));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __112__PXPeopleSuggestionDataSource_suggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions_completion___block_invoke_146;
    v63[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
    v63[4] = *(_QWORD *)(a1 + 88);
    objc_msgSend(v20, "_pl_filter:", v63);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v20;
    v50 = v17;
    v47 = v21;
    if (objc_msgSend(v21, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CD1528], "fetchKeyFaceByPersonLocalIdentifierForPersons:options:", v21, 0, v21, v20);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v51 = (void *)MEMORY[0x1E0C9AA70];
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count", v47));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v24 = *(id *)(a1 + 48);
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v60 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v23, "addObject:", v29);
          }
          else if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v30 = v29;
            objc_msgSend(v30, "localIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "objectForKeyedSubscript:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (v32)
            {
              v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD16E8]), "initWithKeyFace:person:confirmed:similarityScore:", v32, v30, 1, 0.0);
              objc_msgSend(v23, "addObject:", v33);

            }
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
      }
      while (v26);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v35 = *(id *)(a1 + 56);
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v56;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v56 != v38)
            objc_enumerationMutation(v35);
          v40 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v34, "addObject:", v40);
          }
          else if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v41 = v40;
            objc_msgSend(v41, "localIdentifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "objectForKeyedSubscript:", v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            if (v43)
            {
              v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD16E8]), "initWithKeyFace:person:confirmed:similarityScore:", v43, v41, 0, 0.0);
              objc_msgSend(v34, "addObject:", v44);

            }
          }
        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
      }
      while (v37);
    }

    v45 = (void *)MEMORY[0x1E0CD16C0];
    v46 = *(_QWORD *)(a1 + 40);
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __112__PXPeopleSuggestionDataSource_suggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions_completion___block_invoke_2;
    v52[3] = &unk_1E511F260;
    v53 = *(id *)(a1 + 64);
    v54 = *(id *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 64), "setToken:", objc_msgSend(v45, "personSuggestionsForPerson:confirmedPersonSuggestions:rejectedPersonSuggestions:completion:", v46, v23, v34, v52));

    v17 = v50;
  }

}

uint64_t __112__PXPeopleSuggestionDataSource_suggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions_completion___block_invoke_146()
{
  return objc_opt_isKindOfClass() & 1;
}

void __112__PXPeopleSuggestionDataSource_suggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "canceled") & 1) == 0)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }

}

+ (void)_mergeAndSaveUserFeedbackForPersons:(id)a3 personChangeRequest:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v12, "fetchPropertySetsIfNeeded");
        objc_msgSend(v12, "userFeedbackProperties");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "userFeedback");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          v9 = objc_msgSend(MEMORY[0x1E0CD17F0], "mergeFeedbackType:withOtherFeedbackType:", objc_msgSend(v14, "type"), v9);

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v6, "targetPerson");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "userFeedbackProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "userFeedback");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "type");

  if (v9 != v18)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD17F0]), "initWithType:feature:context:", v9, 0, 0);
    objc_msgSend(v6, "setUserFeedback:", v19);

  }
}

@end
