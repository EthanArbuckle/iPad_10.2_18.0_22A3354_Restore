@implementation PGPhotosChallengeHolidayAlgorithmWrapper

- (PGPhotosChallengeHolidayAlgorithmWrapper)initWithEvaluationContext:(id)a3
{
  id v4;
  PGPhotosChallengeHolidayAlgorithmWrapper *v5;
  uint64_t v6;
  PGGraph *graph;
  uint64_t v8;
  PHPhotoLibrary *photoLibrary;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGPhotosChallengeHolidayAlgorithmWrapper;
  v5 = -[PGPhotosChallengeHolidayAlgorithmWrapper init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "graph");
    v6 = objc_claimAutoreleasedReturnValue();
    graph = v5->_graph;
    v5->_graph = (PGGraph *)v6;

    objc_msgSend(v4, "photoLibrary");
    v8 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v5->_photoLibrary;
    v5->_photoLibrary = (PHPhotoLibrary *)v8;

  }
  return v5;
}

- (unsigned)predictedQuestionStateForAssetUUID:(id)a3 holidayName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unsigned __int16 v20;
  uint64_t v21;
  void *v22;
  PGGraphIngestHolidayProcessorHelper *v24;
  void *v25;
  PGGraphIngestHolidayProcessorHelper *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  PGGraphIngestHolidayProcessorHelper *v32;
  id v33;
  id v34;
  PGPhotosChallengeHolidayAlgorithmWrapper *v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  __int16 v41;
  _QWORD v42[3];

  v42[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CD1390];
  v42[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchAssetsWithUUIDs:options:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAsset:withType:options:", v12, 3, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[PGGraph momentNodeForMoment:](self->_graph, "momentNodeForMoment:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "localStartDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localEndDate");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        v20 = 1;
        if (v17 && v18)
        {
          -[PGGraph infoNode](self->_graph, "infoNode");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "locale");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            v26 = objc_alloc_init(PGGraphIngestHolidayProcessorHelper);
            v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B180]), "initWithLocale:", v30);
            +[PGGraphIngestHolidayProcessorHelper keyboardLanguageCodesForInfoNode:holidayService:](PGGraphIngestHolidayProcessorHelper, "keyboardLanguageCodesForInfoNode:holidayService:", v29, v28);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = 0;
            v39 = &v38;
            v40 = 0x2020000000;
            v41 = 3;
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
            v21 = objc_claimAutoreleasedReturnValue();
            v31[0] = MEMORY[0x1E0C809B0];
            v31[1] = 3221225472;
            v31[2] = __91__PGPhotosChallengeHolidayAlgorithmWrapper_predictedQuestionStateForAssetUUID_holidayName___block_invoke;
            v31[3] = &unk_1E84295A8;
            v24 = v26;
            v32 = v24;
            v33 = v30;
            v27 = v25;
            v34 = v27;
            v35 = self;
            v36 = v16;
            v37 = &v38;
            objc_msgSend(v28, "enumerateEventRulesWithNames:betweenLocalDate:andLocalDate:usingBlock:", v21, v17, v19, v31);
            v22 = (void *)v21;
            v20 = *((_WORD *)v39 + 12);

            _Block_object_dispose(&v38, 8);
          }

        }
      }
      else
      {
        v20 = 1;
      }

    }
    else
    {
      v20 = 1;
    }

  }
  else
  {
    v20 = 1;
  }

  return v20;
}

- (id)debugInformationForHolidayName:(id)a3 assetUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  PGGraphIngestHolidayProcessorHelper *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  _BOOL4 v46;
  uint64_t v47;
  const __CFString *v48;
  const __CFString *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _BOOL4 v56;
  void *v57;
  void *v58;
  PGHolidayClassifier *v59;
  PGGraphIngestHolidayProcessorHelper *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[12];
  _QWORD v90[12];
  id v91;
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PGGraph infoNode](self->_graph, "infoNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B180]), "initWithLocale:", v9);
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    objc_msgSend(v10, "eventRules");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v85, v92, 16);
    if (v12)
    {
      v13 = v12;
      v82 = v8;
      v83 = v10;
      v80 = v7;
      v81 = v9;
      v14 = *(_QWORD *)v86;
      v15 = (void *)MEMORY[0x1E0C9AA70];
LABEL_4:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v86 != v14)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v16);
        objc_msgSend(v17, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", v6);

        if ((v19 & 1) != 0)
          break;
        if (v13 == ++v16)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v85, v92, 16);
          if (v13)
            goto LABEL_4;
          v20 = v11;
          v7 = v80;
          v9 = v81;
          v8 = v82;
          v10 = v83;
          goto LABEL_31;
        }
      }
      v20 = v17;

      if (!v20)
      {
        v15 = (void *)MEMORY[0x1E0C9AA70];
        v7 = v80;
        v9 = v81;
        v8 = v82;
        v10 = v83;
        goto LABEL_32;
      }
      -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0CD1390];
      v7 = v80;
      v91 = v80;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v91, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "fetchAssetsWithUUIDs:options:", v23, v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "firstObject");
      v25 = objc_claimAutoreleasedReturnValue();

      v26 = (void *)v25;
      v10 = v83;
      if (v25)
      {
        objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAsset:withType:options:", v25, 3, v21);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "firstObject");
        v28 = objc_claimAutoreleasedReturnValue();

        v79 = (void *)v28;
        if (v28)
        {
          -[PGGraph momentNodeForMoment:](self->_graph, "momentNodeForMoment:", v28);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          if (v78)
          {
            objc_msgSend(v78, "collection");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "sceneNodes");
            v68 = v26;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "sceneNames");
            v69 = v21;
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "allObjects");
            v67 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v67, "componentsJoinedByString:");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "collection");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "addressNodes");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "countryNodes");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "names");
            v73 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v73, "componentsJoinedByString:", CFSTR(","));
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "countryCode");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "requiredTraits");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "defaultScenesWithImportanceString");
            v66 = (void *)objc_claimAutoreleasedReturnValue();

            v84 = 0;
            objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v66, 0, &v84);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = v84;
            v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v64, 4);
            objc_msgSend(v20, "explicitlySupportedCountryCodes");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "componentsJoinedByString:", CFSTR(","));
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            +[PGGraphIngestHolidayProcessorHelper keyboardLanguageCodesForInfoNode:holidayService:](PGGraphIngestHolidayProcessorHelper, "keyboardLanguageCodesForInfoNode:holidayService:", v82, v83);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "componentsJoinedByString:", CFSTR(","));
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_alloc_init(PGGraphIngestHolidayProcessorHelper);
            -[PGGraphIngestHolidayProcessorHelper holidayCalendarEventRuleTraitsForMomentNode:](v36, "holidayCalendarEventRuleTraitsForMomentNode:", v78);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = -[PGGraphIngestHolidayProcessorHelper momentTraitsMatchesHolidayTraits:momentNode:loggingConnection:](v36, "momentTraitsMatchesHolidayTraits:momentNode:loggingConnection:", v20, v78, MEMORY[0x1E0C81028]);
            objc_msgSend(v78, "collection");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "dateNodes");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "anyNode");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "localDate");
            v61 = (void *)objc_claimAutoreleasedReturnValue();

            v59 = objc_alloc_init(PGHolidayClassifier);
            v60 = v36;
            -[PGGraphIngestHolidayProcessorHelper dateScoreForEventRule:localeCountryCode:momentCountryCodes:keyboardLanguageCodes:momentDate:](v36, "dateScoreForEventRule:localeCountryCode:momentCountryCodes:keyboardLanguageCodes:momentDate:", v20, v71, v73, v70, v61);
            v41 = v40;
            -[PGGraphIngestHolidayProcessorHelper sceneScoreForEventRule:localeCountryCode:momentCountryCodes:keyboardLanguageCodes:momentNode:](v36, "sceneScoreForEventRule:localeCountryCode:momentCountryCodes:keyboardLanguageCodes:momentNode:", v20, v71, v73, v70, v78);
            v43 = v42;
            -[PGGraphIngestHolidayProcessorHelper locationScoreForEventRule:localeCountryCode:momentCountryCodes:keyboardLanguageCodes:](v36, "locationScoreForEventRule:localeCountryCode:momentCountryCodes:keyboardLanguageCodes:", v20, v71, v73, v70);
            v45 = v44;
            v46 = -[PGHolidayClassifier isCelebratingForDateScore:sceneScore:locationScore:](v59, "isCelebratingForDateScore:sceneScore:locationScore:", v41, v43, v44);
            v89[0] = CFSTR("momentSceneNames");
            v89[1] = CFSTR("momentCountryCodes");
            v90[0] = v77;
            v90[1] = v76;
            v90[2] = v71;
            v89[2] = CFSTR("localeCountryCode");
            v89[3] = CFSTR("momentTraits");
            objc_msgSend(v72, "description");
            v47 = objc_claimAutoreleasedReturnValue();
            v58 = (void *)v47;
            if (v56)
              v48 = CFSTR("YES");
            else
              v48 = CFSTR("NO");
            v90[3] = v47;
            v90[4] = v48;
            v89[4] = CFSTR("allRequiredRulesApplyForMomentNode");
            v89[5] = CFSTR("holidaySceneCriteria");
            v90[5] = v75;
            v90[6] = v74;
            v89[6] = CFSTR("holidayCriteriaSupportedCountryCodes");
            v89[7] = CFSTR("isCelebrating");
            if (v46)
              v49 = CFSTR("YES");
            else
              v49 = CFSTR("NO");
            v90[7] = v49;
            v89[8] = CFSTR("dateScore");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v41);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "stringValue");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v90[8] = v50;
            v89[9] = CFSTR("sceneScore");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v43);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "stringValue");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v90[9] = v52;
            v89[10] = CFSTR("locationScore");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v45);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "stringValue");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v89[11] = CFSTR("keyboardLanguageCodes");
            v90[10] = v54;
            v90[11] = v62;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 12);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            v21 = v69;
            v26 = v68;

            v10 = v83;
          }
          else
          {
            v15 = (void *)MEMORY[0x1E0C9AA70];
          }

        }
        else
        {
          v15 = (void *)MEMORY[0x1E0C9AA70];
        }
        v9 = v81;
        v8 = v82;

      }
      else
      {
        v15 = (void *)MEMORY[0x1E0C9AA70];
        v9 = v81;
        v8 = v82;
      }

    }
    else
    {
      v15 = (void *)MEMORY[0x1E0C9AA70];
      v20 = v11;
    }
LABEL_31:

LABEL_32:
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v15;
}

- (PGGraph)graph
{
  return self->_graph;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

void __91__PGPhotosChallengeHolidayAlgorithmWrapper_predictedQuestionStateForAssetUUID_holidayName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  v14 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a3;
  objc_msgSend(v6, "countryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "momentsCelebratingRule:localDates:userCountryCode:keyboardLanguageCodes:graph:loggingConnection:", v14, v7, v8, *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), MEMORY[0x1E0C81028]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "positivelyClassifiedMomentNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v10, "containsObject:", *(_QWORD *)(a1 + 64));

  if (!(_DWORD)v8)
  {
    objc_msgSend(v9, "negativelyClassifiedMomentNodes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "containsObject:", *(_QWORD *)(a1 + 64)) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "countryCode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "backfillForCountryCode:", v12) & 1) != 0)
      {
        v13 = objc_msgSend(*(id *)(a1 + 64), "isInterestingForMemories");

        if (!v13)
          goto LABEL_9;
        goto LABEL_2;
      }

    }
    goto LABEL_9;
  }
LABEL_2:
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 2;
LABEL_9:

}

@end
