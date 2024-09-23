@implementation PGPeopleWallpaperSuggesterPersonImportanceAnalyzer

- (PGPeopleWallpaperSuggesterPersonImportanceAnalyzer)initWithGraph:(id)a3 curationContext:(id)a4 loggingConnection:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGPeopleWallpaperSuggesterPersonImportanceAnalyzer *v12;
  PGPeopleWallpaperSuggesterPersonImportanceAnalyzer *v13;
  void *v14;
  uint64_t v15;
  NSString *mePersonLocalIdentifier;
  void *v17;
  void *v18;
  uint64_t v19;
  NSDate *latestLibraryDate;
  uint64_t v21;
  NSDate *earliestDateForCandidates;
  uint64_t v23;
  NSDate *earliestDateForBasePersons;
  NSMutableDictionary *v25;
  NSMutableDictionary *personInformationByPersonLocalIdentifier;
  objc_super v28;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)PGPeopleWallpaperSuggesterPersonImportanceAnalyzer;
  v12 = -[PGPeopleWallpaperSuggesterPersonImportanceAnalyzer init](&v28, sel_init);
  v13 = v12;
  if (v12)
  {
    *(_OWORD *)&v12->_normalizedDeviationForVeryImportantPersons = xmmword_1CA8EDAE0;
    v12->_favoritePersonsAreVIPs = 1;
    objc_storeStrong((id *)&v12->_graph, a3);
    objc_storeStrong((id *)&v13->_curationContext, a4);
    objc_storeStrong((id *)&v13->_loggingConnection, a5);
    -[PGGraph meNodeWithFallbackInferredMeNode](v13->_graph, "meNodeWithFallbackInferredMeNode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    mePersonLocalIdentifier = v13->_mePersonLocalIdentifier;
    v13->_mePersonLocalIdentifier = (NSString *)v15;

    +[PGGraphNodeCollection nodesInGraph:](PGGraphMomentNodeCollection, "nodesInGraph:", v13->_graph);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "universalDateInterval");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "endDate");
    v19 = objc_claimAutoreleasedReturnValue();
    latestLibraryDate = v13->_latestLibraryDate;
    v13->_latestLibraryDate = (NSDate *)v19;

    if (v13->_latestLibraryDate)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", -63115200.0);
      v21 = objc_claimAutoreleasedReturnValue();
      earliestDateForCandidates = v13->_earliestDateForCandidates;
      v13->_earliestDateForCandidates = (NSDate *)v21;
    }
    else
    {
      earliestDateForCandidates = v13->_earliestDateForCandidates;
      v13->_earliestDateForCandidates = 0;
    }

    if (v13->_latestLibraryDate)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", -220903200.0);
      v23 = objc_claimAutoreleasedReturnValue();
      earliestDateForBasePersons = v13->_earliestDateForBasePersons;
      v13->_earliestDateForBasePersons = (NSDate *)v23;
    }
    else
    {
      earliestDateForBasePersons = v13->_earliestDateForBasePersons;
      v13->_earliestDateForBasePersons = 0;
    }

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    personInformationByPersonLocalIdentifier = v13->_personInformationByPersonLocalIdentifier;
    v13->_personInformationByPersonLocalIdentifier = v25;

  }
  return v13;
}

- (BOOL)_isVeryImportantPersonWithPersonNode:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isMyPartner") & 1) != 0
    || (objc_msgSend(v4, "isMyInferredPartner") & 1) != 0
    || (objc_msgSend(v4, "isMyChild") & 1) != 0)
  {
    v5 = 1;
  }
  else if (self->_favoritePersonsAreVIPs)
  {
    v5 = objc_msgSend(v4, "isFavorite");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)gatherPersonInformationWithProgress:(id)a3
{
  id v4;
  NSObject *loggingConnection;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  PGPeopleWallpaperSuggesterPersonInformation *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[16];

  v4 = a3;
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "[PersonImportanceAnalyzer] Gathering Person Information", buf, 2u);
  }
  -[CLSCurationContext personUUIDByMergeCandidateUUID](self->_curationContext, "personUUIDByMergeCandidateUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __90__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_gatherPersonInformationWithProgress___block_invoke;
  v20[3] = &unk_1E8433740;
  v9 = v7;
  v21 = v9;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v20);
  if (-[NSString length](self->_mePersonLocalIdentifier, "length"))
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", self->_mePersonLocalIdentifier);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PGPeopleWallpaperSuggesterPersonInformation initWithPersonLocalIdentifier:importance:unverifiedMergeCandidateLocalIdentifiers:]([PGPeopleWallpaperSuggesterPersonInformation alloc], "initWithPersonLocalIdentifier:importance:unverifiedMergeCandidateLocalIdentifiers:", self->_mePersonLocalIdentifier, 3, v10);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_personInformationByPersonLocalIdentifier, "setObject:forKeyedSubscript:", v11, self->_mePersonLocalIdentifier);

  }
  +[PGGraphPersonNodeCollection personNodesExcludingMeInGraph:](PGGraphPersonNodeCollection, "personNodesExcludingMeInGraph:", self->_graph);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSCurationContext userFeedbackCalculator](self->_curationContext, "userFeedbackCalculator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "personUUIDsWithNegativeFeedback");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  self->_hasFavoritedPersons = 0;
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __90__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_gatherPersonInformationWithProgress___block_invoke_2;
  v17[3] = &unk_1E8433768;
  v17[4] = self;
  v18 = v14;
  v19 = v9;
  v15 = v9;
  v16 = v14;
  objc_msgSend(v12, "enumerateNodesUsingBlock:", v17);

}

- (void)gatherMomentInformationWithProgress:(id)a3
{
  void (**v4)(void *, _BYTE *, double);
  double v5;
  double Current;
  NSObject *loggingConnection;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *momentLocalIdentifiersByPersonLocalIdentifier;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  char v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(void *, _BYTE *, double))_Block_copy(a3);
  v5 = 0.0;
  if (v4)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      v27 = 0;
      v4[2](v4, &v27, 0.0);
      if (v27)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v29 = 138;
          v30 = 2080;
          v31 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Autobahn/PGPeopleWallpaperSuggesterPersonImportanceAnalyzer.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_23;
      }
      v5 = Current;
    }
  }
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "[PersonImportanceAnalyzer] Gathering Moment Information", buf, 2u);
  }
  if (self->_latestLibraryDate
    && (v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", self->_earliestDateForBasePersons, self->_latestLibraryDate)) != 0)
  {
    v9 = (void *)v8;
    +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:inGraph:](PGGraphMomentNodeCollection, "momentNodesForLocalDateInterval:inGraph:", v8, self->_graph);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[PGGraphNodeCollection nodesInGraph:](PGGraphMomentNodeCollection, "nodesInGraph:", self->_graph);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_latestLibraryDate
    && (v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", self->_earliestDateForCandidates, self->_latestLibraryDate)) != 0)
  {
    v12 = (void *)v11;
    +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:inGraph:](PGGraphMomentNodeCollection, "momentNodesForLocalDateInterval:inGraph:", v11, self->_graph);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = v10;
  }
  v14 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphMomentNode consolidatedPersonInMoment](PGGraphMomentNode, "consolidatedPersonInMoment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "adjacencyWithSources:relation:targetsClass:", v10, v15, objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  momentLocalIdentifiersByPersonLocalIdentifier = self->_momentLocalIdentifiersByPersonLocalIdentifier;
  self->_momentLocalIdentifiersByPersonLocalIdentifier = v17;

  objc_msgSend(v16, "transposed");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "intersectingTargetsWith:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sources");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __90__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_gatherMomentInformationWithProgress___block_invoke;
  v24[3] = &unk_1E8433768;
  v24[4] = self;
  v25 = v20;
  v26 = v19;
  v22 = v19;
  v23 = v20;
  objc_msgSend(v21, "enumerateNodesUsingBlock:", v24);

  if (v4)
  {
    if (CFAbsoluteTimeGetCurrent() - v5 >= 0.01)
    {
      v27 = 0;
      v4[2](v4, &v27, 1.0);
      if (v27)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v29 = 180;
          v30 = 2080;
          v31 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Autobahn/PGPeopleWallpaperSuggesterPersonImportanceAnalyzer.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
    }
  }

LABEL_23:
}

- (void)computePersonImportancesWithProgress:(id)a3
{
  id v4;
  void *v5;
  double v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  double Current;
  char v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD v19[5];
  char v20;
  uint64_t v21;
  double *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _Block_copy(v4);
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = (double *)&v21;
  v23 = 0x2020000000;
  v24 = 0;
  if (!v5
    || (v6 = CFAbsoluteTimeGetCurrent(), v6 - v22[3] < 0.01)
    || (v22[3] = v6,
        v20 = 0,
        (*((void (**)(void *, char *, double))v5 + 2))(v5, &v20, 0.0),
        v7 = *((_BYTE *)v26 + 24) | v20,
        (*((_BYTE *)v26 + 24) = v7) == 0))
  {
    v8 = (void *)MEMORY[0x1E0D4B128];
    -[NSMutableDictionary allKeys](self->_momentLocalIdentifiersByPersonLocalIdentifier, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __91__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_computePersonImportancesWithProgress___block_invoke;
    v19[3] = &unk_1E8433790;
    v19[4] = self;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __91__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_computePersonImportancesWithProgress___block_invoke_2;
    v14[3] = &unk_1E84337B8;
    v10 = v5;
    v18 = 0x3F847AE147AE147BLL;
    v16 = &v21;
    v17 = &v25;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v8, "calculateStandardDeviationForItems:valueBlock:result:", v9, v19, v14);

    if (*((_BYTE *)v26 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_15:

        goto LABEL_16;
      }
      *(_DWORD *)buf = 67109378;
      v30 = 215;
      v31 = 2080;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestion"
            "s/Suggesters/Autobahn/PGPeopleWallpaperSuggesterPersonImportanceAnalyzer.m";
      v11 = MEMORY[0x1E0C81028];
    }
    else
    {
      if (!v5)
        goto LABEL_15;
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v22[3] < 0.01)
        goto LABEL_15;
      v22[3] = Current;
      v20 = 0;
      (*((void (**)(id, char *, double))v10 + 2))(v10, &v20, 1.0);
      v13 = *((_BYTE *)v26 + 24) | v20;
      *((_BYTE *)v26 + 24) = v13;
      if (!v13 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_15;
      *(_DWORD *)buf = 67109378;
      v30 = 217;
      v31 = 2080;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestion"
            "s/Suggesters/Autobahn/PGPeopleWallpaperSuggesterPersonImportanceAnalyzer.m";
      v11 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v30 = 185;
    v31 = 2080;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestions/"
          "Suggesters/Autobahn/PGPeopleWallpaperSuggesterPersonImportanceAnalyzer.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_16:
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

}

- (id)personInformationsWithProgress:(id)a3
{
  id v4;
  void *v5;
  double v6;
  char v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *loggingConnection;
  NSMutableDictionary *personInformationByPersonLocalIdentifier;
  double v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double Current;
  char v24;
  _QWORD v26[5];
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  double *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  _QWORD v51[2];
  uint8_t buf[4];
  int v53;
  __int16 v54;
  const char *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _Block_copy(v4);
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v43 = 0;
  v44 = (double *)&v43;
  v45 = 0x2020000000;
  v46 = 0;
  if (!v5
    || (v6 = CFAbsoluteTimeGetCurrent(), v6 - v44[3] < 0.01)
    || (v44[3] = v6,
        v42 = 0,
        (*((void (**)(void *, char *, double))v5 + 2))(v5, &v42, 0.0),
        v7 = *((_BYTE *)v48 + 24) | v42,
        (*((_BYTE *)v48 + 24) = v7) == 0))
  {
    v9 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __85__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_personInformationsWithProgress___block_invoke;
    v37[3] = &unk_1E8434F30;
    v10 = v5;
    v38 = v10;
    v39 = &v43;
    v40 = &v47;
    v41 = 0x3F847AE147AE147BLL;
    -[PGPeopleWallpaperSuggesterPersonImportanceAnalyzer gatherPersonInformationWithProgress:](self, "gatherPersonInformationWithProgress:", v37);
    if (*((_BYTE *)v48 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v53 = 227;
        v54 = 2080;
        v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Autobahn/PGPeopleWallpaperSuggesterPersonImportanceAnalyzer.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v8 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_37;
    }
    v32[0] = v9;
    v32[1] = 3221225472;
    v32[2] = __85__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_personInformationsWithProgress___block_invoke_176;
    v32[3] = &unk_1E8434F30;
    v11 = v10;
    v33 = v11;
    v34 = &v43;
    v35 = &v47;
    v36 = 0x3F847AE147AE147BLL;
    -[PGPeopleWallpaperSuggesterPersonImportanceAnalyzer gatherMomentInformationWithProgress:](self, "gatherMomentInformationWithProgress:", v32);
    if (*((_BYTE *)v48 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v53 = 232;
        v54 = 2080;
        v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Autobahn/PGPeopleWallpaperSuggesterPersonImportanceAnalyzer.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v8 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_36;
    }
    v27[0] = v9;
    v27[1] = 3221225472;
    v27[2] = __85__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_personInformationsWithProgress___block_invoke_177;
    v27[3] = &unk_1E8434F30;
    v12 = v11;
    v28 = v12;
    v29 = &v43;
    v30 = &v47;
    v31 = 0x3F847AE147AE147BLL;
    -[PGPeopleWallpaperSuggesterPersonImportanceAnalyzer computePersonImportancesWithProgress:](self, "computePersonImportancesWithProgress:", v27);
    if (*((_BYTE *)v48 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v53 = 237;
        v54 = 2080;
        v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Autobahn/PGPeopleWallpaperSuggesterPersonImportanceAnalyzer.m";
        v13 = MEMORY[0x1E0C81028];
LABEL_18:
        _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "[PersonImportanceAnalyzer] Merge candidate mapping:", buf, 2u);
      }
      personInformationByPersonLocalIdentifier = self->_personInformationByPersonLocalIdentifier;
      v26[0] = v9;
      v26[1] = 3221225472;
      v26[2] = __85__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_personInformationsWithProgress___block_invoke_178;
      v26[3] = &unk_1E84337E0;
      v26[4] = self;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](personInformationByPersonLocalIdentifier, "enumerateKeysAndObjectsUsingBlock:", v26);
      if (!v5
        || (v16 = CFAbsoluteTimeGetCurrent(), v16 - v44[3] < 0.01)
        || (v44[3] = v16,
            v42 = 0,
            (*((void (**)(id, char *, double))v12 + 2))(v12, &v42, 0.9),
            v17 = *((_BYTE *)v48 + 24) | v42,
            (*((_BYTE *)v48 + 24) = v17) == 0))
      {
        -[NSMutableDictionary allValues](self->_personInformationByPersonLocalIdentifier, "allValues");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("importance"), 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = v19;
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("personLocalIdentifier"), 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v51[1] = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "sortedArrayUsingDescriptors:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5
          && (Current = CFAbsoluteTimeGetCurrent(), Current - v44[3] >= 0.01)
          && (v44[3] = Current,
              v42 = 0,
              (*((void (**)(id, char *, double))v12 + 2))(v12, &v42, 1.0),
              v24 = *((_BYTE *)v48 + 24) | v42,
              (*((_BYTE *)v48 + 24) = v24) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v53 = 254;
            v54 = 2080;
            v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Autobahn/PGPeopleWallpaperSuggesterPersonImportanceAnalyzer.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v8 = (id)MEMORY[0x1E0C9AA60];
        }
        else
        {
          v8 = v22;
        }

        goto LABEL_35;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v53 = 247;
        v54 = 2080;
        v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Autobahn/PGPeopleWallpaperSuggesterPersonImportanceAnalyzer.m";
        v13 = MEMORY[0x1E0C81028];
        goto LABEL_18;
      }
    }
    v8 = (id)MEMORY[0x1E0C9AA60];
LABEL_35:

LABEL_36:
LABEL_37:

    goto LABEL_38;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v53 = 222;
    v54 = 2080;
    v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestions/"
          "Suggesters/Autobahn/PGPeopleWallpaperSuggesterPersonImportanceAnalyzer.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v8 = (id)MEMORY[0x1E0C9AA60];
LABEL_38:
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);

  return v8;
}

- (double)normalizedDeviationForVeryImportantPersons
{
  return self->_normalizedDeviationForVeryImportantPersons;
}

- (void)setNormalizedDeviationForVeryImportantPersons:(double)a3
{
  self->_normalizedDeviationForVeryImportantPersons = a3;
}

- (double)normalizedDeviationForImportantPersons
{
  return self->_normalizedDeviationForImportantPersons;
}

- (void)setNormalizedDeviationForImportantPersons:(double)a3
{
  self->_normalizedDeviationForImportantPersons = a3;
}

- (BOOL)favoritePersonsAreVIPs
{
  return self->_favoritePersonsAreVIPs;
}

- (void)setFavoritePersonsAreVIPs:(BOOL)a3
{
  self->_favoritePersonsAreVIPs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentLocalIdentifiersByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_personInformationByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_earliestDateForBasePersons, 0);
  objc_storeStrong((id *)&self->_earliestDateForCandidates, 0);
  objc_storeStrong((id *)&self->_latestLibraryDate, 0);
  objc_storeStrong((id *)&self->_mePersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_curationContext, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

void __85__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_personInformationsWithProgress___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __85__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_personInformationsWithProgress___block_invoke_176(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.5 + 0.1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __85__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_personInformationsWithProgress___block_invoke_177(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.3 + 0.6);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __85__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_personInformationsWithProgress___block_invoke_178(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSObject *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v5;
    _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "[PersonImportanceAnalyzer] \t%@", buf, 0xCu);
  }
  v17 = v5;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v6, "dupedPersonLocalIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

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
        v15 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          *(_DWORD *)buf = 138412290;
          v24 = v16;
          _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "[PersonImportanceAnalyzer] \t\t%@", buf, 0xCu);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

}

double __91__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_computePersonImportancesWithProgress___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  double v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (double)(unint64_t)objc_msgSend(v2, "count");

  return v3;
}

void __91__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_computePersonImportancesWithProgress___block_invoke_2(uint64_t a1, double a2, double a3)
{
  double Current;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  double v18;
  void *v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  NSObject *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  double v32;
  __int16 v33;
  double v34;
  __int16 v35;
  const __CFString *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 40)
    || (Current = CFAbsoluteTimeGetCurrent(),
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8),
        Current - *(double *)(v7 + 24) < *(double *)(a1 + 64))
    || (*(double *)(v7 + 24) = Current,
        buf[0] = 0,
        (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(0.5),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                               + 24)) == 0))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(NSObject **)(v8 + 24);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v32 = a3;
      v33 = 2048;
      v34 = a2;
      _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "[PersonImportanceAnalyzer] Mean = %f, stdev = %f", buf, 0x16u);
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(NSObject **)(v8 + 24);
    }
    v10 = a3 + *(double *)(v8 + 96) * a2;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v32 = v10;
      _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "[PersonImportanceAnalyzer] Frequency for very important persons: %f", buf, 0xCu);
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(NSObject **)(v8 + 24);
    }
    v11 = a3 + *(double *)(v8 + 104) * a2;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v32 = v11;
      _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "[PersonImportanceAnalyzer] Frequency for important persons: %f", buf, 0xCu);
      v8 = *(_QWORD *)(a1 + 32);
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(*(id *)(v8 + 80), "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v13)
    {
      v15 = v13;
      v16 = *(_QWORD *)v28;
      *(_QWORD *)&v14 = 138412802;
      v26 = v14;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v12);
          v18 = *(double *)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKeyedSubscript:", *(_QWORD *)&v18, v26);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (double)(unint64_t)objc_msgSend(v19, "count");

          v21 = *(_QWORD *)(a1 + 32);
          if (*(_BYTE *)(v21 + 40) || v10 > v20)
          {
            if (v11 <= v20)
            {
              v22 = 1;
              v23 = CFSTR("Important Person");
            }
            else
            {
              v22 = 0;
              v23 = CFSTR("Other");
            }
          }
          else
          {
            v22 = 2;
            v23 = CFSTR("Very Important Person");
          }
          v24 = *(NSObject **)(v21 + 24);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v26;
            v32 = v18;
            v33 = 2048;
            v34 = v20;
            v35 = 2112;
            v36 = v23;
            _os_log_impl(&dword_1CA237000, v24, OS_LOG_TYPE_INFO, "[PersonImportanceAnalyzer] Person %@: frequency = %f, importance %@", buf, 0x20u);
            v21 = *(_QWORD *)(a1 + 32);
          }
          objc_msgSend(*(id *)(v21 + 72), "objectForKeyedSubscript:", *(_QWORD *)&v18);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "mergeImportance:", v22);

        }
        v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      }
      while (v15);
    }

  }
}

void __90__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_gatherMomentInformationWithProgress___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("[PersonImportanceAnalyzer] Person (%@, %@)"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "localIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));

    if (v9)
    {
      v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v7;
        v11 = "%@: Me, ignoring";
LABEL_7:
        _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, v11, buf, 0xCu);
      }
    }
    else
    {
      if (((objc_msgSend(v3, "isMyCoworker") & 1) != 0 || objc_msgSend(v3, "isMyInferredCoworker"))
        && (objc_msgSend(v3, "isMemberOfMyFamily") & 1) == 0
        && (objc_msgSend(v3, "isInferredMemberOfMyFamily") & 1) == 0
        && (objc_msgSend(v3, "isFavorite") & 1) == 0)
      {
        v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          goto LABEL_16;
        *(_DWORD *)buf = 138412290;
        v21 = v7;
        v11 = "%@: Coworker and not family or favorite, ignoring";
        goto LABEL_7;
      }
      v12 = objc_msgSend(v3, "identifier");
      objc_msgSend(*(id *)(a1 + 40), "targetsForSourceIdentifier:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localIdentifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v14);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setObject:forKeyedSubscript:", v15, v4);

      v16 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = v16;
        v18 = objc_msgSend(v14, "count");
        objc_msgSend(*(id *)(a1 + 48), "targetsForSourceIdentifier:", v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v21 = v7;
        v22 = 1024;
        v23 = v18;
        v24 = 1024;
        v25 = objc_msgSend(v19, "count");
        _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "%@: %d very recent moments, %d recent moments", buf, 0x18u);

      }
    }
  }
  else
  {
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v7;
      v11 = "%@: no localIdentifier, ignoring";
      goto LABEL_7;
    }
  }
LABEL_16:

}

void __90__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_gatherPersonInformationWithProgress___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0CD16C0];
  v6 = a3;
  objc_msgSend(v5, "localIdentifierWithUUID:", a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16C0], "localIdentifierWithUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);
  }
  objc_msgSend(v8, "addObject:", v9);

}

void __90__PGPeopleWallpaperSuggesterPersonImportanceAnalyzer_gatherPersonInformationWithProgress___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  PGPeopleWallpaperSuggesterPersonInformation *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length")
    && (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32)) & 1) == 0)
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v5 + 40))
    {
      v6 = 1;
    }
    else
    {
      v6 = objc_msgSend(v3, "isFavorite");
      v5 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(v5 + 40) = v6;
    v7 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CD16C0], "uuidFromLocalIdentifier:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v7, "containsObject:", v8);

    v9 = *(_QWORD **)(a1 + 32);
    if ((_DWORD)v7)
    {
      v10 = v9[3];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = v10;
        objc_msgSend(v3, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412546;
        v23 = v12;
        v24 = 2112;
        v25 = v4;
        _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_INFO, "[PersonImportanceAnalyzer] (%@, %@) is rejected because of negative feedback", (uint8_t *)&v22, 0x16u);

      }
      v13 = -1;
    }
    else if (objc_msgSend(v9, "_isVeryImportantPersonWithPersonNode:", v3))
    {
      v14 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = v14;
        objc_msgSend(v3, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412546;
        v23 = v16;
        v24 = 2112;
        v25 = v4;
        _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "[PersonImportanceAnalyzer] (%@, %@) is very important person", (uint8_t *)&v22, 0x16u);

      }
      v13 = 2;
    }
    else if (objc_msgSend(v3, "isFavorite"))
    {
      v17 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v20 = v17;
        objc_msgSend(v3, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412546;
        v23 = v21;
        v24 = 2112;
        v25 = v4;
        _os_log_debug_impl(&dword_1CA237000, v20, OS_LOG_TYPE_DEBUG, "[PersonImportanceAnalyzer] (%@, %@) is important person", (uint8_t *)&v22, 0x16u);

      }
      v13 = 1;
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[PGPeopleWallpaperSuggesterPersonInformation initWithPersonLocalIdentifier:importance:unverifiedMergeCandidateLocalIdentifiers:]([PGPeopleWallpaperSuggesterPersonInformation alloc], "initWithPersonLocalIdentifier:importance:unverifiedMergeCandidateLocalIdentifiers:", v4, v13, v18);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setObject:forKeyedSubscript:", v19, v4);

  }
}

@end
